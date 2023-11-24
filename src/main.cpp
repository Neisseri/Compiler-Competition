#include <iostream>
#include <fstream>
#include "frontend/lexer_parser/SysYBaseVisitor.h"
#include "frontend/lexer_parser/SysYLexer.h"
#include "frontend/lexer_parser/SysYParser.h"
#include "frontend/ast/astVisitor.hpp"
#include "frontend/type_check/typer.hpp"
#include "frontend/IR/irgenerator.hpp"
#include "antlr4-runtime.h"
#include "midend/iroptimizer.hpp"
#include <getopt.h>

#define VISITOR 1 // 0 for listener, 1 for visitor

using namespace antlr4;
using namespace tree;
using namespace std;

int main(int argc, char *argv[])
{
    bool mem_to_reg_flag = 0;
    bool o2_flag = 0;
    std::string input_file_path = argv[1];
    std::string output_file_path = "./a.out";
    int out_stage = 3;

    int opt;
    int digit_optind = 0;
    int option_index = 0;
    char *string = "o:f:";
    static struct option long_options[] =
    {  
        {"m2r", no_argument, NULL, 'm'},
        {"o2", no_argument, NULL, 'O'},
        {"ast", no_argument, NULL, 'a'},
        {"ir", no_argument, NULL, 'i'},
        {"riscv", no_argument, NULL, 'r'},
        {NULL, 0, NULL, 0},
    }; 
    while((opt =getopt_long_only(argc, argv, string, long_options, &option_index))!= -1)
    {  
        if (opt == 'm'){
            mem_to_reg_flag = 1;
        }else if (opt == 'O'){
            o2_flag = 1;
        }else if (opt == 'o'){
            output_file_path = optarg;
        }else if (opt == 'f'){
            input_file_path = optarg;
        }else if (opt == 'a'){
            out_stage = 1;
        }else if (opt == 'i'){
            out_stage = 2;
        }else if (opt == 'r'){
            out_stage = 3;
        }
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

    // riscv::Program program(ir_generator.ir_program);
    // for (auto [name, func]: program.functions) {
    //     func->do_reg_alloc();
    //     func->emitend();
    // }

    // if (out_stage == 3){
    //     cout << "riscv: " << endl;
    //     program.emit(cout);
    //     ofstream output_file;
    //     output_file.open(output_file_path);
    //     program.emit(output_file);
    //     output_file.close();
    // }

    return 0;
}