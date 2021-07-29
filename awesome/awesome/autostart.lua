-- Programs to have running when awesomewm starts up
local awful = require("awful")

-- Daemons
awful.spawn.once("nitrogen --restore")
awful.spawn.once("picom --experimental-backends")

-- GUIS
awful.spawn.once("slack")
awful.spawn.once("discord")

-- Xorg config but via cli since Xorg config sucks
awful.spawn.once('xinput set-prop "Apple Inc. Magic Trackpad 2" "libinput Natural Scrolling Enabled" 1')
awful.spawn.once('xinput set-prop "Apple Inc. Magic Trackpad 2" "libinput Tapping Enabled" 0')

