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
  local width = math.min(screen_geometry.width * 0.90, 2600)
  local height = math.min(1000, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2
 
  return bling.module.scratchpad:new {
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
end


local monitor_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2600)
  local height = math.min(1600, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2

  return bling.module.scratchpad:new {
    command = "kitty --class kitty-monitor btop",
    rule = {class = "kitty-monitor"},
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
end

-- initialize scratchpads
_M.init = function()
    local scratchpads = {
      terminal = terminal_scratch,
      monitor = monitor_scratch
    }

    for name, scratch in pairs(scratchpads) do
      _M[name] = scratch(screen.primary.geometry)
    end
end

return _M
