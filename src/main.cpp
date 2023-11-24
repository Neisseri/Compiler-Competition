#include <iostream>
#include <fstream>
#include <string>
#include "frontend/lexer_parser/SysYBaseVisitor.h"
#include "frontend/lexer_parser/SysYLexer.h"
#include "frontend/lexer_parser/SysYParser.h"
#include "frontend/ast/astVisitor.hpp"
#include "frontend/IR/irgenerator.hpp"
#include "antlr4-runtime.h"
#include "backend/riscv/riscv.hpp"

// backend
#include "backend/riscv/riscv.hpp"
#include "backend/riscv/translate.hpp"

#define VISITOR 1 // 0 for listener, 1 for visitor

using namespace antlr4;
using namespace tree;
using namespace std;

int main(int argc, const char *argv[])
{
    ifstream f_stream;
    f_stream.open(argv[1]);
    string s = argv[1];
    std::string tag = s.substr(5, s.length() - 7);
    std::cout << tag << "-------------------" << std::endl;
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
        ofstream output_file;
        output_file.open("ir/" + tag + ".ir");
        std::cout << "ir/" + tag + ".ir" << std::endl;
        ir_generator.ir_program.print(output_file, 0);
        output_file.close();
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
    if (step == 4) {
        cout << "riscv: " << endl;
        riscv::Program program(ir_generator.ir_program);
        for (auto [name, func]: program.functions) {
            func->do_reg_alloc();
            func->emitend();
        }
        // output to file
        ofstream output_file;
        output_file.open("riscv/" + tag + ".s");
        program.emit(output_file);
        output_file.close();
    }

    return 0;
}