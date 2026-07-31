local mainMod = "SUPER"

-- Programs

local terminal    = "kitty"
local fileManager = "dolphin"
local launcher    = "hyprlauncher"
local browser     = "firefox"
local screenshots = "flameshot gui"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(launcher))
hl.bind("PRINT", hl.dsp.exec_cmd(screenshots))

-- Functions

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("dunstctl close-all"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("rofi -modi \"clipboard:greenclip print\" -show clipboard"))
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd("rofimoji"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Layouts

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + M", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + B", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move windows and focus

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace

hl.bind(mainMod .. " + T", hl.dsp.workspace.toggle_special("quickterminal"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.move({ workspace = "special:quickterminal" }))
hl.bind(mainMod .. " + D", hl.dsp.focus({ workspace = 11 }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +1%"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -1%"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true, repeating = false })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true, repeating = false })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"), { locked = true, repeating = true })

hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("playerctl -p spotify play-pause"), { locked = true })
hl.bind(mainMod .. " + BRACKETRIGHT", hl.dsp.exec_cmd("playerctl -p spotify next"), { locked = true })
hl.bind(mainMod .. " + BRACKETLEFT", hl.dsp.exec_cmd("playerctl -p spotify previous"), { locked = true })

-- Submaps

hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    hl.bind("ESCAPE", hl.dsp.submap("reset"))

    hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
    hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }))
    hl.bind("J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }))

    hl.bind("SHIFT + L", hl.dsp.window.resize({ x = 40, y = 0, relative = true }))
    hl.bind("SHIFT + H", hl.dsp.window.resize({ x = -40, y = 0, relative = true }))
    hl.bind("SHIFT + K", hl.dsp.window.resize({ x = 0, y = -40, relative = true }))
    hl.bind("SHIFT + J", hl.dsp.window.resize({ x = 0, y = 40, relative = true }))
end)
