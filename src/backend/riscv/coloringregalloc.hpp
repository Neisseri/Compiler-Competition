#include "riscv.hpp"
#include "const.hpp"
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
        std::map<Reg, Reg> alias;
        std::map<Reg, int> color;

        Function* func;
        int K;
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

    public:
        coloringregalloc(Function* func): func(func) {}
        ~coloringregalloc();
        void Main();
    };
    
    void coloringregalloc::Main() {
        func->do_liveness_analysis();
        Build();
        MkWorklist();
        do {
            if (!simplifyWorklist.empty()) Simplify();
            else if (!worklistMoves.empty()) Coalesce();
            else if (!freezeWorklist.empty()) Freeze();
            else if (!spillWorklist.empty()) SelectSpill();
        } while (
            !(simplifyWorklist.empty() && worklistMoves.empty() && freezeWorklist.empty() && spillWorklist.empty())
        );
        AssignColors();
        if (!spilledNodes.empty()) {
            RewriteProgram();
            Main();
        }
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
        return u.id > 0;
    }

    void coloringregalloc::Build() {
        adjList.clear();
        adjSet.clear();
        degree.clear();
        int inf = 1e10;
        for (int i = 0; i < 26; i++) {
            degree[Reg(General, i)] = inf;
        }
        for (auto bb: func->bbs) {
            auto live = bb->live_out;
            for (auto i = bb->instructions.rbegin(); i != bb->instructions.rend(); i++) {
                if (auto move = dynamic_cast<Move*>(*i)) {
                    for (auto u: move->use())
                        live.erase(u);
                    for (auto n: move->def())
                        moveList[n].insert(move);
                    for (auto u: move->use())
                        moveList[u].insert(move);
                    worklistMoves.insert(move);
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
        std::set<Reg> initial;
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
            if (degree[r] >= K)
                spillWorklist.insert(r);
            else if (MoveRelated(r))
                freezeWorklist.insert(r);
            else
                simplifyWorklist.insert(r);
        }
    }

    void coloringregalloc::Simplify() {
        auto it = *simplifyWorklist.begin();
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
                simplifyWorklist.insert(v);
            }
        }
    }

    void coloringregalloc::SelectSpill() {
        auto m = *spillWorklist.begin();
        spillWorklist.erase(m);
        simplifyWorklist.insert(m);
        FreezeMoves(m);
    }

    void coloringregalloc::AssignColors() {
        while (!selectStack.empty()) {
            Reg n = selectStack.back();
            selectStack.pop_back();
            std::set<int> okColors;
            for (int i = 0; i < 26; i++)
                okColors.insert(i);
            for (Reg w: adjList[n]) {
                Reg u = GetAlias(w);
                if (isPrecolored(u) || coloredNodes.count(u))
                    okColors.erase(color[u]);
            }
            if (okColors.empty())
                spilledNodes.insert(n);
            else {
                coloredNodes.insert(n);
                color[n] = *okColors.begin();
            }
        }
        for (auto n: coalescedNodes)
            color[n] = color[GetAlias(n)];
    }

    void RewriteProgram() {
        return;
    }

}