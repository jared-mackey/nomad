-- Programs to have running when awesomewm starts up
local awful = require("awful")

-- Daemons
awful.spawn.once("nitrogen --restore")
awful.spawn.once("picom --experimental-backends")
awful.spawn.once("udiskie")
-- awful.spawn.once("kitty tmux")

-- GUIS
awful.spawn.once("slack")
-- awful.spawn.once("discord")

