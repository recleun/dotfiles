hl.window_rule({
    match = { class = "firefox" },
    workspace = 2,
})

hl.window_rule({
    match = { class = "zen" },
    workspace = 2,
})

hl.window_rule({
    match = { class = "discord" },
    workspace = 3,
})

hl.window_rule({
    match = { class = "Spotify" },
    workspace = 4,
})

hl.window_rule({
    match = { class = "steam", title = "Steam" },
    workspace = 5,
})

hl.window_rule({
    match = { class = "steam", title = "Friends List" },
    workspace = 5,
    float = true,
    center = true,
    size = { 300, 700 },
})

-- Ignore maximize requests from all apps
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

