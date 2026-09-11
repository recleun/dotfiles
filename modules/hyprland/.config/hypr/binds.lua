local mainMod = "SUPER"

local binds = {
    -- programs
    { bind = mainMod .. " + RETURN", command = hl.dsp.exec_cmd("kitty") }, -- terminal
    { bind = mainMod .. " + W", command = hl.dsp.exec_cmd("firefox") }, -- browser
    { bind = mainMod .. " + E", command = hl.dsp.exec_cmd("kitty yazi") }, -- file explorer
    { bind = mainMod .. " + Q", command = hl.dsp.exec_cmd("noctalia msg panel-open launcher") }, -- launcher
    { bind = mainMod .. " + V", command = hl.dsp.exec_cmd("noctalia msg panel-open clipboard") }, -- clipboard
    { bind = "PRINT", command = hl.dsp.exec_cmd("noctalia msg screenshot-region") }, -- screenshots

    -- noctalia extras
    { bind = mainMod .. " + S", command = hl.dsp.exec_cmd("noctalia msg panel-open control-center") },
    { bind = mainMod .. " + P", command = hl.dsp.exec_cmd("noctalia msg panel-open session") },
    { bind = mainMod .. " + N", command = hl.dsp.exec_cmd("noctalia msg panel-open control-center notifications") },
    { bind = mainMod .. " + SLASH", command = hl.dsp.exec_cmd("noctalia msg panel-open wallpaper") },
    { bind = "ALT + TAB", command = hl.dsp.exec_cmd("noctalia msg window-switcher") },

    -- functions
    { bind = mainMod .. " + C", command = hl.dsp.window.close() },
    { bind = mainMod .. " + F", command = hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })},
    { bind = mainMod .. " + SHIFT + N", command = hl.dsp.exec_cmd("noctalia msg notification-clear-active") },
    { bind = mainMod .. " + SHIFT + E", command = hl.dsp.window.close() },

    -- layout
    { bind = mainMod .. " + SHIFT + F", command = hl.dsp.window.fullscreen({ action = "toggle" })},
    { bind = mainMod .. " + M", command = hl.dsp.window.float({ action = "toggle" })},
    { bind = mainMod .. " + B", command = hl.dsp.layout("togglesplit")},

    -- window controls
    { bind = mainMod .. " + H", command = hl.dsp.focus({ direction = "left" })},
    { bind = mainMod .. " + L", command = hl.dsp.focus({ direction = "right" })},
    { bind = mainMod .. " + K", command = hl.dsp.focus({ direction = "up" })},
    { bind = mainMod .. " + J", command = hl.dsp.focus({ direction = "down" })},
    { bind = mainMod .. " + SHIFT + H", command = hl.dsp.window.move({ direction = "left" })},
    { bind = mainMod .. " + SHIFT + L", command = hl.dsp.window.move({ direction = "right" })},
    { bind = mainMod .. " + SHIFT + K", command = hl.dsp.window.move({ direction = "up" })},
    { bind = mainMod .. " + SHIFT + J", command = hl.dsp.window.move({ direction = "down" })},

    -- special workspaces
    { bind = mainMod .. " + T", command = hl.dsp.workspace.toggle_special("quickterminal")},
    { bind = mainMod .. " + SHIFT + T", command = hl.dsp.window.move({ workspace = "special:quickterminal" })},
    { bind = mainMod .. " + D", command = hl.dsp.focus({ workspace = 11 })},

    -- mouse controls
    { bind = mainMod .. " + mouse:272", command = hl.dsp.window.drag(),   { mouse = true }},
    { bind = mainMod .. " + mouse:273", command = hl.dsp.window.resize(), { mouse = true }},

    -- keyboard functions
    { bind = "XF86AudioRaiseVolume", command = hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +1%"), opts = { locked = true, repeating = true }},
    { bind = "XF86AudioLowerVolume", command = hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -1%"), opts = { locked = true, repeating = true }},
    { bind = "XF86AudioMute", command = hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), opts = { locked = true, repeating = false }},
    { bind = "XF86AudioMicMute", command = hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), opts = { locked = true, repeating = false }},
    { bind = "XF86MonBrightnessUp", command = hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"), opts = { locked = true, repeating = true }},
    { bind = "XF86MonBrightnessDown", command =hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"), opts = { locked = true, repeating = true }},

    -- spotify shortcuts
    -- { bind = mainMod .. " + P", command = hl.dsp.exec_cmd("playerctl -p spotify play-pause"), opts = { locked = true }},
    -- { bind = mainMod .. " + BRACKETRIGHT", command = hl.dsp.exec_cmd("playerctl -p spotify next"), opts = { locked = true }},
    -- { bind = mainMod .. " + BRACKETLEFT", command = hl.dsp.exec_cmd("playerctl -p spotify previous"), opts = { locked = true }},
}

for i = 1, #binds do
    if binds[i].opts then
        hl.bind(binds[i].bind, binds[i].command, binds[i].opts)
    else
        hl.bind(binds[i].bind, binds[i].command)
    end
end

-- switch workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- submaps
require("submaps.resize").init(mainMod)
