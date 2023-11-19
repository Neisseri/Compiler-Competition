#include <iostream>
#include <fstream>
#include "frontend/lexer_parser/SysYBaseVisitor.h"
#include "frontend/lexer_parser/SysYLexer.h"
#include "frontend/lexer_parser/SysYParser.h"
#include "frontend/ast/astVisitor.hpp"
#include "frontend/IR/irgenerator.hpp"
#include "antlr4-runtime.h"
#include "backend/riscv/riscv.hpp"
#include "backend/riscv/translate.cpp"

#define VISITOR 1 // 0 for listener, 1 for visitor

using namespace antlr4;
using namespace tree;
using namespace std;

int main(int argc, const char *argv[])
{
    ifstream f_stream;
    f_stream.open(argv[1]);
    ANTLRInputStream input(f_stream);
    frontend::SysYLexer lexer(&input);
    CommonTokenStream tokens(&lexer);
    frontend::SysYParser parser(&tokens);
    ParseTree *tree = parser.compUnit();
    int step = *(argv[2]) - '0';
    //输出parse tree，这里的visit的作用是什么？
    cout<<"parse tree: "<<endl;
    frontend::SysYBaseVisitor parse_visitor;
    parse_visitor.visit(tree);
    cout << tree->toStringTree(&parser, true) << endl;
    // ast构建
    ASTVisitor ast_visitor;
    auto AST = ast_visitor.visit(tree).as<ast::Program *>();
    if (step == 2)
    {
        //输出ast,到cout
        cout<<"ast: "<<endl;
        AST->print(cout, 0);
    }

    cout << "building ir ---------------------------" << endl;

    IRGenerator ir_generator;
    ir_generator.visitPromgram(AST);

    if (step == 3){
        cout <<"ir: "<<endl;
        ir_generator.ir_program.print(cout, 0);
    }

    // TODO:对ast作符号检查
    // NamerVisitor namer;
    // namer.visit(AST);

    // // TODO:对ast做类型检查
    // TyperVisitor typer;
    // typer.visit(AST);

    // // TODO:生成ir
    // IrGenerator ir_generator;
    // ir_generator.visit(AST);


    // TODO:优化ir

    // TODO:生成riscv代码并优化
    // riscv::Program rv_program = riscv::Program()
    // riscv::translate(rv_program, ir_generator.ir_program);
    // build_basic_blocks(rv_prg);
    // liveness_analyze();
    // reg_alloc();
    // emit_end();

    return 0;
}