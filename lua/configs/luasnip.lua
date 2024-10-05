
print(vim.fn.stdpath("config"))
print(vim.fn.stdpath("config") .. "/snips/")
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({paths = {vim.fn.stdpath("config") .. "/snips/"}})
