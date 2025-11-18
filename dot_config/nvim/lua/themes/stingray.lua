-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understanding properties, fields, and what highlightings the color used for
---@type Base46Table
local M = {}
-- UI
M.base_30 = {
  white = "#14b4b4",
  black = "#0e091d", -- usually your theme bg
  darker_black = "#0e081d", -- 6% darker than black
  black2 = "#0e091d", -- 6% lighter than black
  one_bg = "#1f1a2d", -- 10% lighter than black
  one_bg2 = "#252142", -- 6% lighter than one_bg
  one_bg3 = "#353142", -- 6% lighter than one_bg2
  grey = "#372372", -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg = "#14b4b4", -- 10% lighter than grey
  grey_fg2 = "#14b4b4", -- 5% lighter than grey
  light_grey = "#603ec7",
  red = "#e20340",
  baby_pink = "#ff1b64",
  pink = "#ff66e6",
  line = "#1f1a2d", -- 15% lighter than black
  green = "#14b470",
  vibrant_green = "#00ffb2",
  nord_blue = "#14b4b4",
  blue = "#008cff",
  seablue = "#00ffb2",
  yellow = "#ff66e6", -- 8% lighter than yellow
  sun = "#cc00aa",
  purple = "#af18f5",
  dark_purple = "#8d00cf",
  teal = "#14b4b4",
  orange = "#e92000",
  cyan = "#00f0fa",
  statusline_bg = "#1f1a2d",
  lightbg = "#353142",
  pmenu_bg = "#1f1a2d",
  folder_bg = "#1f1a2d",
}

-- check https://github.com/chriskempson/base16/blob/master/styling.md for more info
M.base_16 = {
  base00 = "#0e091d",
  base01 = "#0e091d",
  base02 = "#1f1a2d",
  base03 = "#252142",
  base04 = "#e20340",
  base05 = "#14b4b4",
  base06 = "#00f0fa",
  base07 = "#00f0fa",
  base08 = "#ff1b64",
  base09 = "#e92000",
  base0A = "#8d00cf",
  base0B = "#00ffb2",
  base0C = "#008cff",
  base0D = "#00ffb2",
  base0E = "#ff66e6",
  base0F = "#14b470",
}

-- set the theme type whether is dark or light
M.type = "dark"

-- this will be later used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "abc")

return M
