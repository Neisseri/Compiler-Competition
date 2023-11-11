#include "const.hpp"
namespace ir {
struct Label {
    LabelType type;
    Label() {}
    Label(LabelType type): type(type) {}
};

struct FuncLabel: Label {
    std::string name;
    FuncLabel(std::string name): name(std::move(name)), Label(LabelType::FuncLabel) {}
};

struct BlockLabel: Label {
    static int num_labels;
    int id;
    BlockLabel(): id(num_labels++), Label(LabelType::BlockLabel) {}
};

}