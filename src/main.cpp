#include <iostream>
#include <fstream>
#include "frontend/lexer_parser/SysYBaseVisitor.h"
#include "frontend/lexer_parser/SysYLexer.h"
#include "frontend/lexer_parser/SysYParser.h"

using namespace antlr4;
using namespace tree;
using namespace std;

ParseTree * get_parse_tree(ifstream &stream, int step){
    ANTLRInputStream input(stream);
    SysYLexer lexer(&input);
    CommonTokenStream tokens(&lexer);
    SysYParser parser(&tokens);
    ParseTree *tree = parser.compUnit();
    // SysYBaseVisitor visitor;
    // visitor.visit(tree);
    if (step == 1){
        cout << tree->toStringTree(&parser,true) << endl;
    }
    return tree;
}

int main(int argc, const char *argv[])
{
    ifstream f_stream;
    f_stream.open(argv[1]);

    int step = *(argv[2]) - '0';

    ParseTree *AST = get_parse_tree(f_stream, step);

    // TODO:对ast作符号检查
    NamerVisitor namer;
    namer.visit(AST);

    // TODO:对ast做类型检查
    TyperVisitor typer;
    typer.visit(AST);

    // TODO:生成ir
    IrGenerator ir_generator;
    ir_generator.visit(AST);


    // TODO:优化ir

    // TODO:生成riscv代码并优化


    return 0;
}