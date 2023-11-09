#include <vector>
#include "../../common/common.hpp"
#include "../../common/const.hpp"

struct Type
{
    int type;
    bool is_const;
    std::vector<int> dim={};

    Type(){}

    Type(int type) : type(type), is_const(false) {}
    Type(TypeEnum type) : type(static_cast<int>(type)), is_const(false) {}
    //TODO:将所有的int类型都改成TypeEnum
    Type(int type, bool is_const) : type(type), is_const(is_const) {}

    Type(int type, std::vector<int> dim) : type(type), is_const(false), dim(std::move(dim)) {}

    Type(const Type & type) : type(type.type), is_const(false), dim(std::move(type.dim)) {}

    int n_dim(){
        return dim.size();
    }
    int get_array_size(){
        int size = 1;
        for (int i : dim){
            size *= i;
        }
        return size;
    }
    int get_size(){
        return get_array_size() * 4;
    }

    bool operator==(const Type &b) const {
        if (this->type != b.type || this->is_const != b.is_const)
            return false;
        return this->dim == b.dim;
    }
    bool operator!=(const Type &b) const {
        return !this->operator==(b);
    }

    std::string toString(int ir=0){
        std::string s;
        switch (type)
        {//enum TypeEnum
        case static_cast<int>(TypeEnum::INT):
            s = ir?"i32":"int";
            break;
        case static_cast<int>(TypeEnum::FLOAT):
            s = "float";
            break;
        default:
            s = ir?"void":"unknown";
            break;
        }
        if (is_const && !ir)
            s = "const " + s;
        // if has dim
        if (dim.size() > 0 && !ir){
            s += " [";
            for (int i : dim){
                s += std::to_string(i) + ", ";
            }
            s += "]";
        }
        return s;
    }
};
