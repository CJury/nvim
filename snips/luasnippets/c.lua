local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local get_file_relative_path = function(args, parent)
  local name = vim.fn.expand("%")
  name = name:gsub("include/","")
  return sn(nil, i(1, name))
end

return {
  s({trig = "/**", dscr = "File header comment"},
    fmta(
      [[
      /**
       * @file <>
       * @brief <>
       */
      <>
      ]],
      {
        d(1, get_file_relative_path), i(2), i(3)
      }
    )
  ),
}
