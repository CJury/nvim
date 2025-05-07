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

local get_include_guard_name = function(args, parent)
  local name = vim.fn.expand("%:r")
  local ext = vim.fn.expand("%:e")
  local header
  if (ext == "h") then
    header = "_C_HEADER"
  else
    header = "HEADER"
  end

  name = name:gsub("%/","_"):gsub("-","_"):gsub("include_",""):upper()..header
  return sn(nil, i(1, name))
end

local get_file_relative_path = function(args, parent)
  local name = vim.fn.expand("%")
  name = name:gsub("include/","")
  return sn(nil, i(1, name))
end

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
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
  s({trig = "guard", dscr= "Header include guard"},
    fmta(
      [[
      #ifndef <>
      #define <>
      <>
      #endif /* <> */
      ]],
      {
        d(1, get_include_guard_name), rep(1), i(0), rep(1)
      }
    )
  ),

}
