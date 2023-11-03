#include <iostream>
#include <fstream>
#include "antlr4-runtime.h"
#include "frontend/SysYBaseVisitor.h"
#include "frontend/SysYLexer.h"
#include "frontend/SysYParser.h"
#include "frontend/astVisitor.hpp"

#define VISITOR 1 // 0 for listener, 1 for visitor

using namespace antlr4;
using namespace tree;
using namespace std;


int main(int argc, const char *argv[])
{
    ifstream stream;
    stream.open(argv[1]);
    ANTLRInputStream input(stream);
    frontend::SysYLexer lexer(&input);
    CommonTokenStream tokens(&lexer);
    frontend::SysYParser parser(&tokens);
    auto tree = parser.compUnit();
    cout<<"parse tree:"<<endl;
    cout << tree->toStringTree(&parser,true) << endl;
    if (VISITOR)
    {
        frontend::AstVisitor visitor;
        cout << "flag1" << endl;
        visitor.visitCompUnit(tree);
        cout<<"flag2"<<endl;
        auto &ast=visitor.compileUnit();
        ast.print(cout,0);
    }
    return 0;
}