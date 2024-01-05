#include "riscv.hpp"
#include "const.hpp"
#include <iostream>
namespace riscv {
    class coloringregalloc
    {
    private:
        std::set<Reg> simplifyWorklist;
        std::set<Reg> freezeWorklist;
        std::set<Reg> spillWorklist;
        std::set<Reg> spilledNodes;
        std::set<Reg> coalescedNodes;
        std::set<Reg> coloredNodes;
        std::vector<Reg> selectStack;

        std::set<Move*> coalescedMoves;
        std::set<Move*> constrainedMoves;
        std::set<Move*> frozenMoves;
        std::set<Move*> worklistMoves;
        std::set<Move*> activeMoves;

        std::set<std::pair<Reg, Reg>> adjSet;
        std::map<Reg, Reg> alias;
        std::map<Reg, std::set<Reg>> adjList;
        std::map<Reg, int> degree;

        std::map<Reg, std::set<Move*>> moveList;
        std::map<Reg, int> color;
        std::set<Reg> initial;

        Function* func;
        int const K = 26;
        void Build();
        void MkWorklist();
        void Simplify();
        void Coalesce();
        void Freeze();
        void SelectSpill();
        void AssignColors();
        void RewriteProgram();

        void AddEdge(Reg u, Reg v);
        std::set<Reg> Adjacent(Reg n);
        std::set<Move*> NodeMoves(Reg n);
        bool MoveRelated(Reg n);

        void DecrementDegree(Reg m);
        void EnableMoves(std::set<Reg> nodes);
        Reg GetAlias(Reg n);
        void AddWorklist(Reg u);
        bool OK(Reg t, Reg r);
        bool Conservative(std::set<Reg> nodes);
        void Combine(Reg u, Reg v);
        void FreezeMoves(Reg u);
        bool isPrecolored(Reg u);
        void ReplaceRegs();

    public:
        coloringregalloc(Function* func): func(func) {}
        ~coloringregalloc() {}
        void Main();
    };
    
    void coloringregalloc::Main() {
        std::cerr << func->name << " Main()\n";
        func->do_liveness_analysis();
        std::cerr << func->name << " do_liveness_analysis() done\n";
        Build();
        std::cerr << func->name << " Build() done\n";
        initial.clear();
        MkWorklist();
        std::cerr << func->name << " MkWorklist() done\n";
        do {
            if (!simplifyWorklist.empty()){
                std::cerr << func->name << " Simplify()\n";
                Simplify();
            } else if (!worklistMoves.empty()) {
                std::cerr << func->name << " Coalesce()\n";
                Coalesce();
            } else if (!freezeWorklist.empty()) {
                std::cerr << func->name << " Freeze()\n";
                Freeze();
            } else if (!spillWorklist.empty()) {
                std::cerr << func->name << " SelectSpill()\n";
                SelectSpill();
            }
        } while (
            !(simplifyWorklist.empty() && worklistMoves.empty() && freezeWorklist.empty() && spillWorklist.empty())
        );
        AssignColors();
        std::cerr << func->name << " AssignColors() done\n";
        if (!spilledNodes.empty()) {
            // for (auto s: spilledNodes)
            //     std::cerr << "spill node " << print_reg(s) << "\n";
            RewriteProgram();
            std::cerr << func->name << " RewriteProgram() done\n";
            for (auto bb: func->bbs) {
                for (auto inst: bb->instructions) {
                    inst->emit(std::cerr);
                }
            }
            Main();
            // return ;
        }
        ReplaceRegs();
    }

    void coloringregalloc::AddEdge(Reg u, Reg v) {
        if (!adjSet.count(std::pair(u, v)) && (u != v)) {
            adjSet.insert(std::pair(u, v));
            adjSet.insert(std::pair(v, u));
            if (!isPrecolored(u)) {
                adjList[u].insert(v);
                degree[u] += 1;
            }
            if (!isPrecolored(v)) {
                adjList[v].insert(u);
                degree[v] += 1;
            }
        }
    }

    bool coloringregalloc::isPrecolored(Reg u) {
        return u.id >= 0;
    }

    void coloringregalloc::Build() {
        adjList.clear();
        adjSet.clear();
        degree.clear();
        int inf = 2147483647;
        for (int i = 0; i < 32; i++) {
            degree[Reg(General, i)] = inf;
        }
        for (auto bb: func->bbs) {
            auto live = bb->live_out;
            for (auto i = bb->instructions.rbegin(); i != bb->instructions.rend(); i++) {
                if (auto move = dynamic_cast<Move*>(*i)) {
                    if (!func->phi_moves.count(move)) {
                        for (auto u: move->use())
                            live.erase(u);
                        for (auto n: move->def())
                            moveList[n].insert(move);
                        for (auto u: move->use())
                            moveList[u].insert(move);
                        worklistMoves.insert(move);
                    }
                }
                for (auto d: (*i)->def())
                    live.insert(d);
                for (auto d: (*i)->def()) 
                    for (auto l: live)
                        AddEdge(l, d);
                for (auto d: (*i)->def())
                    live.erase(d);
                for (auto u: (*i)->use())
                    live.insert(u);
            }
        }
    }

    std::set<Reg> coloringregalloc::Adjacent(Reg n) {
        auto rst = adjList[n];
        for (auto i: selectStack)
            rst.erase(i);
        for (auto i: coalescedNodes)
            rst.erase(i);
        return rst;
    }
    
    std::set<Move*> coloringregalloc::NodeMoves(Reg n) {
        std::set<Move*> rst = {};
        for (auto i: activeMoves)
            if (moveList[n].find(i) != moveList[n].end())
                rst.insert(i);
        for (auto i: worklistMoves)
            if (moveList[n].find(i) != moveList[n].end())
                rst.insert(i);
        return rst;
    }

    bool coloringregalloc::MoveRelated(Reg n) {
        return !NodeMoves(n).empty();
    }

    void coloringregalloc::MkWorklist() {
        for (auto bb: func->bbs) {
            for (auto inst: bb->instructions) {
                auto def = inst->def();
                auto use = inst->use();
                for (auto u: use) {
                    if (!isPrecolored(u))
                        initial.insert(u);
                }
                for (auto d: def) {
                    if (!isPrecolored(d))
                        initial.insert(d);
                }
            }
        }
        for (auto r: initial) {
            if (degree[r] >= K){
                std::cerr << "spill reg MkWorklist insert " << print_reg(r) << "\n";
                spillWorklist.insert(r);
            }
            else if (MoveRelated(r)) {
                std::cerr << "freeze reg MkWorklist insert " << print_reg(r) << "\n";
                freezeWorklist.insert(r);
            }
            else {
                std::cerr << "simplify reg MkWorklist insert " << print_reg(r) << "\n";
                simplifyWorklist.insert(r);
            }
        }
    }

    void coloringregalloc::Simplify() {
        auto it = *simplifyWorklist.begin();
        // std::cerr << "simplify reg erase " << print_reg(it) << "\n";
        simplifyWorklist.erase(it);
        selectStack.push_back(it);
        for (Reg m: Adjacent(it))
            DecrementDegree(m);
    }

    void coloringregalloc::DecrementDegree(Reg m) {
        int d = degree[m];
        degree[m] = d-1;
        if (d == K) {
            auto nodes = Adjacent(m);
            nodes.insert(m);
            EnableMoves(nodes);
            spillWorklist.erase(m);
            if (MoveRelated(m)) {
                freezeWorklist.insert(m);
            }
            else {
                // std::cerr << "simplify reg DecrementDegree insert " << print_reg(m) << "\n";
                simplifyWorklist.insert(m);
            }
        }
    }

    void coloringregalloc::EnableMoves(std::set<Reg> nodes) {
        for (auto n: nodes) {
            for (auto move: NodeMoves(n)) {
                if (activeMoves.count(move)) {
                    activeMoves.erase(move);
                    worklistMoves.insert(move);
                }
            }
        }
    }

    void coloringregalloc::Coalesce() {
        auto m = *worklistMoves.begin();
        Reg x = m->dst;
        Reg y = m->src;
        Reg u = GetAlias(x);
        Reg v = GetAlias(y);
        if (isPrecolored(y)) {
            std::swap(u, v);
        }
        worklistMoves.erase(m);
        // std::cout << "combine u " << print_reg(u) << " and v " << print_reg(v) << "\n";
        if (u == v) {
            coalescedMoves.insert(m);
            AddWorklist(u);
        }
        else if (isPrecolored(v) || adjSet.count(std::pair(u, v))) {
            constrainedMoves.insert(m);
            AddWorklist(u);
            AddWorklist(v);
        }
        else {
            bool should_combine = true;
            if (isPrecolored(u)) {
                for (auto t: Adjacent(v)) {
                    if (!OK(t, u)) {
                        should_combine = false;
                        break;
                    }
                }
            }
            else {
                auto nodes = Adjacent(u);
                for (auto n: Adjacent(v)) {
                    nodes.insert(n);
                }
                should_combine = Conservative(nodes);
            }
            if (should_combine) {
                // std::cout << "should combine\n";
                coalescedMoves.insert(m);
                Combine(u, v);
                AddWorklist(u);
            }
            else {
                activeMoves.insert(m);
            }
        }

    }

    Reg coloringregalloc::GetAlias(Reg n) {
        if (coalescedNodes.count(n))
            return GetAlias(alias[n]);
        else
            return n;
    }

    void coloringregalloc::AddWorklist(Reg u) {
        if (!isPrecolored(u) && !MoveRelated(u) && degree[u] < K) {
            freezeWorklist.erase(u);
            // std::cerr << "simplify reg AddWorklist insert " << print_reg(u) << "\n";
            simplifyWorklist.insert(u);
        }
    }

    bool coloringregalloc::OK(Reg t, Reg r) {
        return degree[t] < K || isPrecolored(t) || adjSet.count(std::pair(t, r));
    }

    bool coloringregalloc::Conservative(std::set<Reg> nodes) {
        int k = 0;
        for (auto n: nodes) {
            if (degree[n] >= K) {
                k = k+1;
            }
        }
        return k < K;
    }

    void coloringregalloc::Combine(Reg u, Reg v) {
        if (freezeWorklist.count(v)) 
            freezeWorklist.erase(v);
        else 
            spillWorklist.erase(v);
        coalescedNodes.insert(v);
        alias[v] = u;
        auto &moves = moveList[u];
        for (auto m: moveList[v]) 
            moves.insert(m);
        for (Reg t: Adjacent(v)) {
            AddEdge(t, u);
            DecrementDegree(t);
        }
        if (degree[u] >= K && freezeWorklist.count(u)) {
            freezeWorklist.erase(u);
            spillWorklist.insert(u);
        }
    }

    void coloringregalloc::Freeze() {
        auto u = *freezeWorklist.begin();
        freezeWorklist.erase(u);
        // std::cerr << "simplify reg Freeze insert " << print_reg(u) << "\n";
        simplifyWorklist.insert(u);
        FreezeMoves(u);
    }

    void coloringregalloc::FreezeMoves(Reg u) {
        for (auto m: NodeMoves(u)) {
            if (activeMoves.count(m)) 
                activeMoves.erase(m);
            else
                worklistMoves.erase(m);
            frozenMoves.insert(m);
            Reg v = (u == m->dst) ? m->src : m->dst;
            if (NodeMoves(v).empty() && degree[v] < K) {
                freezeWorklist.erase(v);
                // std::cerr << "simplify reg FreezeMoves insert " << print_reg(v) << "\n";
                simplifyWorklist.insert(v);
            }
        }
    }

    void coloringregalloc::SelectSpill() {
        std::cerr << "select spill entry\n" << std::endl;
        auto m = *(std::prev(spillWorklist.end()));
        int mid = m.id;
        for (auto i : spillWorklist) {
            if (i.id > mid) {
                m = i;
                mid = i.id;
            }
        }
        spillWorklist.erase(m);
        // std::cerr << "simplify reg SelectSpill insert " << print_reg(m) << "\n";
        simplifyWorklist.insert(m);
        FreezeMoves(m);
    }

    void coloringregalloc::AssignColors() {
        // std::cout << ":)" << std::endl;
        color.clear();
        // for (auto n: selectStack) {
        //     std::cout << "select stack " << print_reg(n) << std::endl;
        // }
        while (!selectStack.empty()) {
            Reg n = selectStack.back();
            selectStack.pop_back();
            std::set<int> okColors;
            for (int i = 0; i < 26; i++)
                okColors.insert(allocable_regs[i]);
            for (Reg w: adjList[n]) {
                Reg u = GetAlias(w);
                if (coloredNodes.count(u))
                    okColors.erase(color[u]);
                else if (isPrecolored(u))
                    okColors.erase(u.id);
            }
            if (okColors.empty())
                spilledNodes.insert(n);
            else {
                coloredNodes.insert(n);
                color[n] = *okColors.begin();
            }
        }
        // for (auto n: coalescedNodes) 
        //     std::cout << "coalescedNodes " << print_reg(n) << "\n";
        for (auto n: coalescedNodes) {
            if (!isPrecolored(GetAlias(n)))
                color[n] = color[GetAlias(n)];
            else
                color[n] = GetAlias(n).id;
        }
    }

    void coloringregalloc::ReplaceRegs() {
        // for (auto n: color) {
        //     std::cout << "assign " << print_reg(n.first) << " to " << print_reg(Reg(General, n.second)) << std::endl;
        // }
        std::cerr << "replace regs\n" << std::endl;
        for (auto &bb: func->bbs) {
            for (auto &inst: bb->instructions) {
                auto reg_ptrs = inst->reg_ptrs();
                for (auto &p : reg_ptrs) {
                    Reg old = *p;
                    if (color.count(old)) {
                        *p = Reg(General, color[old]);
                    }
                }
            }
        }
    }

    void coloringregalloc::RewriteProgram() {
        std::set<Reg> newTemps;
        for (auto n: spilledNodes) {
            // assign memory location for each n
            func->offsets[n] = func->frame_size;
            func->frame_size += 4;
            // insert a store after each def, insert a load before each use
            for (auto &bb: func->bbs) {
                for (auto inst = bb->instructions.begin(); inst != bb->instructions.end(); inst++) {
                    auto use = (*inst)->use();
                    auto def = (*inst)->def();
                    if (def.count(n)) {
                        Reg ni = func->freshTemp();
                        newTemps.insert(ni);
                        for (auto &p: (*inst)->reg_ptrs())
                            if (*p == n)
                                *p = ni;
                        bb->instructions.emplace(std::next(inst), new StoreWord(ni, Reg(General, sp), func->offsets[n]));
                    }
                    else if (use.count(n)) {
                        Reg ni = func->freshTemp();
                        newTemps.insert(ni);
                        for (auto &p: (*inst)->reg_ptrs())
                            if (*p == n)
                                *p = ni;
                        bb->instructions.emplace(inst, new LoadWord(ni, Reg(General, sp), func->offsets[n]));
                    }
                }
            }
        }
        spilledNodes.clear();
        for (auto n: coloredNodes)
            initial.insert(n);
        for (auto n: coalescedNodes)
            initial.insert(n);
        for (auto n: newTemps)
            initial.insert(n);
        coloredNodes.clear();
        coalescedNodes.clear();
    }

}