local awful = require("awful")
local bling = require("module.bling")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local awestore = require("awestore")
local helpers = require("helpers")

local terminal_scratch = bling.module.scratchpad:new {
  command = "kitty --class kitty-scratch --hold",
  rule = {class = "kitty-scratch"},
  sticky = true,
  autoclose = false,
  geometry = {x = dpi(60), y = dpi(200), height = dpi(1000), width = dpi(2150)},
  floating = true,
  reapply = true,
  awestore = {
    y = awestore.tweened(-12000, { duration = 500, easing = awestore.easing.cubic_in_out })
  }
}

awesome.connect_signal("scratch::terminal", function() terminal_scratch:toggle() end)

local monitor_scratch = bling.module.scratchpad:new {
  command = "kitty --class kitty-monitor btm",
  rule = {class = "kitty-monitor"},
  sticky = true,
  autoclose = false,
  geometry = {x = dpi(60), y = dpi(200), height = dpi(1000), width = dpi(2150)},
  floating = true,
  reapply = true,
  awestore = {
    y = awestore.tweened(-12000, { duration = 400, easing = awestore.easing.cubic_in_out })
  }
}

awesome.connect_signal("scratch::monitor", function() monitor_scratch:toggle() end)


