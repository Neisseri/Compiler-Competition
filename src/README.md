# 技术文档

## frontend

### ast

它现在还是个小废物，你可以在 `src/frontend/astVisitor.hpp` 中看到我实现了哪些访问器。

而且我还没有实现 `src/frontend/ast.hpp` 中的所有节点，所以你可以在 `src/frontend/astVisitor.hpp` 中看到我实现了哪些节点。

还有它非常易错，好像连加法都做不了，如果你测试的时候发现了问题，请提 issue。

后面typer访问的时候会用到它，所以我先实现了它。具体的实现可以看 `src/frontend/ast.hpp`。

### typer

