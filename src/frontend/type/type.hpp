#include <vector>

struct Type
{
    int type;
    bool is_const;
    std::vector<int> dim;

    Type(){}

    Type(int type) : type{type}, is_const{false} {}

    Type(int type, bool is_const) : type(type), is_const{is_const} {}

    Type(int type, std::vector<int> dim) : type{type}, is_const{false}, dim{std::move(dim)} {}
    
    Type(Type & type) : type{type.type}, is_const{false}, dim{std::move(type.dim)} {}

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
};
