# Note On Usage of LuaSnip

[LuaSnip] (https://github.com/L3MON4D3/LuaSnip) is a powerful snippet engine. Although with a great documentation, here are some caveats scatterred around its corner that needs attention.

## Jump

The insert node is visited in the order of their jump-index: `1,2,3, ... ,0`. The jump index of each note can be specified by `i(n)`. See [documentation] (https://github.com/L3MON4D3/LuaSnip/blob/8d6c0a93dec34900577ba725e91c44b8d3ca1f45/DOC.md#insertnode).

Luasnip automatically insert `i(0)` at the end of the snippet if it is not defined manually. This means when defining jumping index let the last index be `i(0)`, or you will be left with an extra trailing jumping unused.
