require("bindings")
require("input")
require("monitor")

local bar = "waybar"
local notification = "mako"
local wallpaper = "swaybg -i ~/.config/hypr/media/bg.png -m fill"

hl.on("hyprland.start", function ()
    hl.exec_cmd(bar)
    hl.exec_cmd(notification)
    hl.exec_cmd(wallpaper)
end)

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
