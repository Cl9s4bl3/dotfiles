local mainButton = "SUPER"
local terminal = "alacritty"
local file_manager = "nautilus"
local drun = "rofi -show drun"
local browser = "microsoft-edge-stable"
local power_menu = "nwg-bar"
local editor = "code"

local raise_volume = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
local lower_volume = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
local mute_toggle = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
local brightness_up = "~/.config/hypr/scripts/brightness.sh up"
local brightness_down = "~/.config/hypr/scripts/brightness.sh down"

local terminal_button = "RETURN"
local close_current_window_button = "W"
local open_file_manager_button = "SHIFT + F"
local pop_window_button = "O"
local drun_button = "SPACE"
local browser_button = "SHIFT + RETURN"
local fullscreen_button = "F"
local power_menu_button = "ESCAPE"
local editor_button = "SHIFT + E"
local move_window_button = "mouse:272" -- Left click
local resize_window_button = "mouse:273" -- Right Click

local volume_up_button = "XF86AudioRaiseVolume"
local volume_down_button = "XF86AudioLowerVolume"
local volume_mute_toggle_button = "XF86AudioMute"
local brightness_up_button = "XF86MonBrightnessUp"
local brightness_down_button = "XF86MonBrightnessDown"

hl.bind(mainButton .. " + " .. terminal_button, hl.dsp.exec_cmd(terminal))
hl.bind(mainButton .. " + " .. close_current_window_button, hl.dsp.window.close())
hl.bind(mainButton .. " + " .. open_file_manager_button, hl.dsp.exec_cmd(file_manager))
hl.bind(mainButton .. " + " .. drun_button, hl.dsp.exec_cmd(drun))
hl.bind(mainButton .. " + " .. browser_button, hl.dsp.exec_cmd(browser))
hl.bind(mainButton .. " + " .. power_menu_button, hl.dsp.exec_cmd(power_menu))
hl.bind(mainButton .. " + " .. editor_button, hl.dsp.exec_cmd(editor))

hl.bind(mainButton .. " + " .. fullscreen_button, hl.dsp.window.fullscreen())
hl.bind(mainButton .. " + " .. move_window_button, hl.dsp.window.drag(), { mouse = true })
hl.bind(mainButton .. " + " .. resize_window_button, hl.dsp.window.resize(), { mouse = true })

hl.bind(volume_up_button, hl.dsp.exec_cmd(raise_volume))
hl.bind(volume_down_button, hl.dsp.exec_cmd(lower_volume))
hl.bind(volume_mute_toggle_button, hl.dsp.exec_cmd(mute_toggle))
hl.bind(brightness_up_button, hl.dsp.exec_cmd(brightness_up))
hl.bind(brightness_down_button, hl.dsp.exec_cmd(brightness_down))

local function toggle_pop_window(width, height)
    local active = hl.get_active_window()

    width = width or 1300
    height = height or 900

    if not active then return end

    if active.pinned then
        hl.dispatch(hl.dsp.window.pin({ window = active, action = "disable" }))
        hl.dispatch(hl.dsp.window.float({ window = active, action = "disable" }))
        hl.dispatch(hl.dsp.window.tag({ window = active, tag = "-pop" }))
    else
        hl.dispatch(hl.dsp.window.float({ window = active, action = "enable" }))

        hl.dispatch(hl.dsp.window.resize({ x = width, y = height, false, window = active }))

        hl.dispatch(hl.dsp.window.center({ window = active }))

        hl.dispatch(hl.dsp.window.pin({ window = active, action = "enable" }))
        hl.dispatch(hl.dsp.window.tag({ window = active, tag = "+pop" }))
    end
end

hl.bind(mainButton .. " + " .. pop_window_button, function ()
    toggle_pop_window()
end)