-- Colorscheme overrides
vim.cmd("hi link xmlEndTag xmlTag")
vim.cmd("hi htmlArg gui=italic")
vim.cmd("hi Comment gui=italic")
vim.cmd("hi Type gui=italic")
vim.cmd("hi htmlArg cterm=italic")
vim.cmd("hi Type cterm=italic")

vim.g.embark_terminal_italics = true

-- uncommented ones are currently gruvbox
local embark = {
  -- bg_dark = "#100E23",
  bg_dark = "#282828",
  -- bg = "#1e1c31",
  bg = "#282828",
  space2 = "#2D2B40",
  space3 = "#3E3859",
  space4 = "#585273",
  -- fg_dark ="#8A889D",
  fg_dark = "#ebdbb2",
  -- fg ="#cbe3e7",
  fg = "#ebdbb2",
  -- red = "#F48FB1",
  red = "#cc241d",
  -- dark_red = "#F02E6E",
  dark_red = "#fb4934",
  -- green = "#A1EFD3",
  green = "#b8bb26",
  -- dark_green = "#62d196",
  dark_green = "#98971a",
  -- yellow = "#ffe6b3",
  yellow = "#fabd2f",
  -- dark_yellow = "#F2B482",
  dark_yellow = "#d79921",
  -- blue = "#91ddff",
  blue = "#83a598",
  -- dark_blue = "#65b2ff",
  dark_blue = "#458588",
  -- purple = "#d4bfff",
  purple = "#d3869b",
  -- dark_purple = "#a37acc",
  dark_purple = "#b16286",
  -- cyan = "#87DFEB",
  cyan = "#8ec07c",
  -- dark_cyan = "#63f2f1"
  dark_cyan = "#689d6a"
}

local themes = {
  embark = embark
}

local get_theme = function()
  theme = themes[os.getenv("THEME")] or embark
  return theme
end

return {
  get_theme = get_theme
}
