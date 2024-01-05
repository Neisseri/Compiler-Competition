// 3rd party
#include <cxxopts.hpp>
#include "antlr4-runtime.h"

// std lib
#include <iostream>
#include <fstream>
#include <string>
#include <filesystem>

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

// utils , some tools
#include "common/utils.hpp"
#include "backend/riscv/riscv.hpp"
#include "backend/riscv/coloringregalloc.hpp"

#define VISITOR 1 // 0 for listener, 1 for visitor

using namespace antlr4;
using namespace tree;
using namespace std;

int main(int argc, char *argv[])
{
    cxxopts::Options options("compiler", "it's a compiler for SysY language made by us with love <3");

    bool mem_to_reg_flag = false;
    bool dce_flag = false;
    bool o2_flag = false;
    bool out_ast_flag = false;
    bool out_ir_flag = false;
    bool out_riscv_flag = false;
    bool out_all_flag = false;

    std::string input_file_path;
    std::string output_file_name;

    options.add_options()("m,m2r", "mem2reg", cxxopts::value<bool>(mem_to_reg_flag)->default_value("false"))("d,dce", "dead code elimination", cxxopts::value<bool>(dce_flag)->default_value("false"))("O,o2", "O2", cxxopts::value<bool>(o2_flag)->default_value("false"))("o,output", "output file name", cxxopts::value<std::string>(output_file_name)->default_value("test"))("f,file", "input file path", cxxopts::value<std::string>(input_file_path)->default_value("test/sample.sy"))("a,ast", "output ast", cxxopts::value<bool>(out_ast_flag)->default_value("false"))("i,ir", "output ir", cxxopts::value<bool>(out_ir_flag)->default_value("false"))("r,riscv", "output riscv", cxxopts::value<bool>(out_riscv_flag)->default_value("false"))("A,all", "output all", cxxopts::value<bool>(out_all_flag)->default_value("false"))("h,help", "Print usage");

    // usage:
    // ("short_name,long_name", "description", cxxopts::value<type>()->default_value("default_value"))

    options.positional_help("[options] <input_file_path>");
    // options.parse_positional({"input_file_path"});

    try
    {
        auto result = options.parse(argc, argv);

        // Display help if requested or if no input file is provided
        if (result.count("file") == 0 || result.count("help") > 0)
        {
            std::cerr << options.help() << std::endl;
            return 0;
        }
    }
    catch (const std::exception &e)
    {
        std::cerr << "Error parsing options: " << e.what() << std::endl;
        return 1;
    }
    if (out_all_flag)
    {
        out_ast_flag = true;
        out_ir_flag = true;
        out_riscv_flag = true;
    }

    ifstream f_stream;
    f_stream.open(input_file_path);

    cerr << "--------------------------- building ast ---------------------------" << endl;

    ANTLRInputStream input(f_stream);
    frontend::SysYLexer lexer(&input);
    CommonTokenStream tokens(&lexer);
    frontend::SysYParser parser(&tokens);
    ParseTree *tree = parser.compUnit();
    // 输出parse tree，这里的visit的作用是什么？
    cerr << "parse tree: " << endl;
    frontend::SysYBaseVisitor parse_visitor;
    parse_visitor.visit(tree);
    cerr << tree->toStringTree(&parser, true) << endl;
    // ast构建
    ASTVisitor ast_visitor;
    auto AST = ast_visitor.visit(tree).as<ast::Program *>();
    cerr << "------------------------------type check------------------------------" << endl;

    TyperVisitor typer;
    typer.visitPromgram(AST);

    if (out_ast_flag)
    {
        cerr << "ast: " << endl;
        AST->print(cerr, 0);
        ofstream output_file = openOrCreateFile("ast", output_file_name, ".c");
        AST->print(output_file, 0);
        output_file.close();
    }

    cerr << "--------------------------- building ir_origin ---------------------------" << endl;

    IRGenerator ir_generator;
    ir_generator.visitPromgram(AST);
    IROptimizer ir_optimizer(&ir_generator);
    if (out_ir_flag)
    {
        cerr << "ir_origin:" << endl;
        ir_generator.ir_program.print(cerr, 0);

        ofstream output_file = openOrCreateFile("ir_origin", output_file_name, ".ll");
        ir_generator.ir_program.print(output_file, 0);
        output_file.close();
    }

    if (mem_to_reg_flag)
    {
        cerr << "---------------------------------ir after mem2reg-------------------------------------" << endl;
        ir_optimizer.mem_to_reg();
        ir_generator.ir_program.print(cerr, 0);
        ofstream output_file = openOrCreateFile("ir-m2r", output_file_name, ".ll");
        ir_generator.ir_program.print(output_file, 0);
        output_file.close();
    }

    if (dce_flag)
    {
        cerr << "---------------------------------ir after dce-------------------------------------" << endl;
        ir_optimizer.dead_code_elimination();
        ir_generator.ir_program.print(cerr, 0);

        ofstream output_file = openOrCreateFile("ir-dce", output_file_name, ".ll");
        ir_generator.ir_program.print(output_file, 0);
        output_file.close();
    }

    if (out_ir_flag)
    {
        cerr << "---------------------------------ir -------------------------------------" << endl;
        ir_generator.ir_program.print(cerr, 0);
        ofstream output_file = openOrCreateFile("ir", output_file_name, ".ll");
        ir_generator.ir_program.print(output_file, 0);
        output_file.close();
    }

    cerr << "--------------------------- building riscv ---------------------------" << endl;

    if (out_riscv_flag)
    {
        cerr << "riscv: " << endl;
        riscv::Program program(ir_generator.ir_program);
        std::cerr << "?\n";
        for (auto [name, func] : program.functions)
        {
            std::cerr << "ir before resolve phi\n";
            func->emit(std::cerr);
            std::cerr << "ir before resolve phi end\n";
            if (mem_to_reg_flag) {
                func->resolve_phi();
                // std::cerr << "---------------------------------ir after resolve phi-------------------------------------" << std::endl;
                // func->emit(std::cerr);
                // std::cerr << "---------------------------------ir after resolve phi end --------------------------------" << std::endl;
            }
            std::cerr << name << "\n";
            riscv::coloringregalloc RegAllocator(func);
            // func->do_reg_alloc();
            RegAllocator.Main();
            func->emitend();
        }
        // output to file
        ofstream output_file = openOrCreateFile("riscv", output_file_name, ".s");
        program.emit(output_file);
        output_file.close();
    }

    return 0;
}