// 3rd party
#include <cxxopts.hpp>
#include "antlr4-runtime.h"

// std lib
#include <iostream>
#include <fstream>
#include <string>

// our own
#include "frontend/lexer_parser/SysYBaseVisitor.h"
#include "frontend/lexer_parser/SysYLexer.h"
#include "frontend/lexer_parser/SysYParser.h"
#include "frontend/ast/astVisitor.hpp"
#include "frontend/type_check/typer.hpp"
#include "frontend/IR/irgenerator.hpp"
#include "midend/iroptimizer.hpp"

// backend
#include "backend/riscv/riscv.hpp"
#include "backend/riscv/translate.hpp"

#define VISITOR 1 // 0 for listener, 1 for visitor

using namespace antlr4;
using namespace tree;
using namespace std;

int main(int argc, char *argv[])
{
    cxxopts::Options options("compiler", "it's a compiler for SysY language made by us with love <3");

    bool mem_to_reg_flag = false;
    bool o2_flag = false;
    std::string input_file_path;
    std::string output_file_path = "./a.out";
    int out_stage = 3;

    options.add_options()
    ("m,m2r", "mem2reg", cxxopts::value<bool>(mem_to_reg_flag)->default_value("false"))
    ("O,o2", "O2", cxxopts::value<bool>(o2_flag)->default_value("false"))
    ("o,output", "output file path", cxxopts::value<std::string>(output_file_path))
    ("f,file", "input file path", cxxopts::value<std::string>(input_file_path))
    ("a,ast", "output ast", cxxopts::value<bool>()->default_value("false"))
    ("i,ir", "output ir", cxxopts::value<bool>()->default_value("false"))
    ("r,riscv", "output riscv", cxxopts::value<bool>()->default_value("false"));

    options.positional_help("[options] <input_file_path>");
    options.parse_positional({"input_file_path"});

    try
    {
        auto result = options.parse(argc, argv);

        // Display help if requested or if no input file is provided
        if (result.count("file") == 0 || result.count("help") > 0)
        {
            std::cout << options.help() << std::endl;
            return 0;
        }

        if (result["a"].as<bool>())
        {
            out_stage = 1;
        }

        if (result["i"].as<bool>())
        {
            out_stage = 2;
        }

        if (result["r"].as<bool>())
        {
            out_stage = 3;
        }
    }
    catch (const std::exception &e)
    {
        std::cerr << "Error parsing options: " << e.what() << std::endl;
        return 1;
    }

    ifstream f_stream;
    f_stream.open(input_file_path);

    cout << "--------------------------- building ast ---------------------------" << endl;

    ANTLRInputStream input(f_stream);
    frontend::SysYLexer lexer(&input);
    CommonTokenStream tokens(&lexer);
    frontend::SysYParser parser(&tokens);
    ParseTree *tree = parser.compUnit();
    //输出parse tree，这里的visit的作用是什么？
    cout<<"parse tree: "<<endl;
    frontend::SysYBaseVisitor parse_visitor;
    parse_visitor.visit(tree);
    cout << tree->toStringTree(&parser, true) << endl;
    // ast构建
    ASTVisitor ast_visitor;
    auto AST = ast_visitor.visit(tree).as<ast::Program *>();
    TyperVisitor typer;
    typer.visitPromgram(AST);

    if (out_stage == 1)
    {
        cout << "ast: " << endl;
        AST->print(cout, 0);

        ofstream output_file;
        output_file.open(output_file_path);
        AST->print(output_file, 0);
        output_file.close();

        return 0;
    }

    cout << "--------------------------- building ir ---------------------------" << endl;

    IRGenerator ir_generator;
    ir_generator.visitPromgram(AST);
    IROptimizer ir_optimizer(&ir_generator);
    if (mem_to_reg_flag || o2_flag){
        ir_optimizer.mem_to_reg();
    }

    if (out_stage == 2){
        cout << "ir:" << endl;
        ir_generator.ir_program.print(cout, 0);

        ofstream output_file;
        output_file.open(output_file_path);
        ir_generator.ir_program.print(output_file, 0);
        output_file.close();

        return 0;
    }

    cout << "--------------------------- building riscv ---------------------------" << endl;

    // TODO:优化ir

    // TODO:生成riscv代码并优化
    if (out_stage == 3)
    {
        cout << "riscv: " << endl;
        riscv::Program program(ir_generator.ir_program);
        for (auto [name, func]: program.functions) {
            func->do_reg_alloc();
            func->emitend();
        }
        // output to file
        ofstream output_file;
        output_file.open("riscv/" + output_file_path + ".s");
        program.emit(output_file);
        output_file.close();
    }

    return 0;
}