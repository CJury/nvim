require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map("v", "jk", "<ESC>")
-- map("n", "<LEADER>c", ":NvimTreeFocus<cr>:tabnew ~/.config/nvim<cr>")
map("n", "<LEADER>s", ":source ~/.config/nvim/init.lua<cr>")
map("n", "<LEADER>dx", ":Neogen<cr>")
map("n", "<LEADER>cf", ":%!clang-format<cr>")
map("n", "<LEADER>ne", ":lua vim.diagnostic.goto_next")
map("n", "<LEADER>bd", ":bp|bd #<cr>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
