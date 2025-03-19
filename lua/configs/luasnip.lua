
print(vim.fn.stdpath("config"))
print(vim.fn.stdpath("config") .. "/snips/")
-- require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({paths = {"~/.config/nvim/snips/luasnippets/"}})
require("luasnip.loaders.from_vscode").lazy_load({paths = {vim.fn.stdpath("config") .. "/snips/vscode/"}})

-- Somewhere in your Neovim startup, e.g. init.lua
require("luasnip").config.set_config({ -- Setting LuaSnip config
  -- Use <Tab> (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})
