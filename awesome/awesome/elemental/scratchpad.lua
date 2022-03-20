local awful = require("awful")
local bling = require("module.bling")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local rubato = require("module.rubato")
local helpers = require("helpers")

local _M = {}

local rubato_with_defaults = function(overrides)
  return rubato.timed {
    pos = overrides.pos or 0,
    rate = overrides.rate or 120,
    easing = overrides.easing or rubato.quadratic,
    intro = overrides.intro or 0.1,
    duration = overrides.duration or 0.3,
    awestore_compat = true
  }
end

local terminal_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2400)
  local height = math.min(1000, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2
 
  local terminal = bling.module.scratchpad:new {
    command = "kitty --class kitty-scratch",
    rule = {class = "kitty-scratch"},
    sticky = true,
    autoclose = true,
    geometry = {x = x, y = dpi(200), height = height, width = width},
    floating = true,
    reapply = true,
    rubato = {
      y = rubato_with_defaults {
        pos = -height
      }
    }
  }
  
  awesome.connect_signal("scratch::terminal", function() terminal:toggle() end)

  return terminal
end


local monitor_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2400)
  local height = math.min(600, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2

  local monitor = bling.module.scratchpad:new {

    command = "kitty --class kitty-monitor btop",
    rule = {class = "kitty-monitor"},
    sticky = true,
    autoclose = true,
    geometry = {x = dpi(60), y = dpi(200), height = dpi(1000), width = dpi(2150)},
    floating = true,
    reapply = true,
    rubato = {
      y = rubato_with_defaults {
        pos = -height
      }
    }
  }

  awesome.connect_signal("scratch::monitor", function() monitor:toggle() end)

  return monitor
end

-- initialize scratchpads
_M.init = function()
    local scratchpads = {
      terminal_scratch,
      monitor_scratch
    }

    for _idx, scratch in pairs(scratchpads) do
      scratch(screen.primary.geometry)
    end
end

return _M
