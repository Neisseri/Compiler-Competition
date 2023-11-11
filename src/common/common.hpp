#pragma once

#include <algorithm>
#include <cassert>
#include <cstdint>
#include <list>
#include <map>
#include <memory>
#include <optional>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <set>
#include <algorithm>
#include <list>
#include <vector>
#include <map>
#include <memory>
#include <optional>
#include <string>
#include <unordered_map>
#include <unordered_set>

#include "../frontend/type/type.hpp"
#include "const.hpp"

namespace ir {
enum InstType {
  ALLOCA,
  ASSIGN,
  LOAD,
  LOADADDR,
  LOADIMM,
  STORE,
  GEP,
  CONVERT,
  CALL,
  UNARY,
  BINARY,
  PHI,
  MEMUSE,
  MEMDEF,
  RETURN,
  JUMP,
  BRANCH,
  SWITCH,
  OUTPUT,
  TERMINATOR,

  LABEL,
};

// enum class UnaryOp { Add, Sub, Not };

// enum class BinaryOp {
//   Add,
//   Sub,
//   Mul,
//   Div,
//   Mod,
//   Eq,
//   Neq,
//   Lt,
//   Gt,
//   Leq,
//   Geq,
//   And,
//   Or,
//   Shr,
//   Shl,
//   NR_OPS
// };

enum ScalarType {
  Int,
  Float,
  String,
};

}