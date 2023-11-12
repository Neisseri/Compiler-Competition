#include "riscv.hpp"
namespace riscv {

void backend_passes(Program &p) {
  for (auto &[name, func] : p.functions) {
    func.do_reg_alloc();
    func.emit_prologue_epilogue();
  }
}

}