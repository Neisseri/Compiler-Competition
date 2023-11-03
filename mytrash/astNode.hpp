#pragma once

#include <iostream>
#include <memory>
#include <string>
#include <sstream>

class AstNode{
    public:
        virtual std::string toString() const = 0;
        virtual ~AstNode() = default;
        virtual void print(std::ostream &os, int indent) const = 0;
        friend std::ostream &operator<<(std::ostream &os, const AstNode &node){
            node.print(os, 0);
            return os;
        }
};