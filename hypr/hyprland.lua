require("bindings")
require("input")
require("monitor")

local bar = "waybar"
local notification = "mako"
local wallpaper = "swaybg -i ~/.config/hypr/media/bg.png -m fill"
local swayosd = "swayosd-server"

hl.on("hyprland.start", function ()
    hl.exec_cmd(bar)
    hl.exec_cmd(notification)
    hl.exec_cmd(wallpaper)
    hl.exec_cmd(swayosd)
end)