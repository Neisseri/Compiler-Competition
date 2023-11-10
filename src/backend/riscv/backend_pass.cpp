#include "riscv.hpp"
namespace riscv {

void backend_passes(Program &p) {
  for (auto &[_, f] : p.functions) {
    f.do_reg_alloc();
    f.emit_prologue_epilogue();
  }
}

}