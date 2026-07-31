-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border = {
                colors = {
                    "rgb(DCD7BA)",
                    -- "rgba(00ff99ee)",
                },
                -- angle = 45,
            },
            inactive_border = "rgb(333333)",
        },

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = false,
            size      = 2,
            passes    = 1,
            vibrancy  = 0.2,
        },
    },

    animations = {
        enabled = true,
    },

    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
    }
})

hl.curve("easeOutQuint", { type = "bezier", points = {{0.22, 1}, {0.36, 1}} })
hl.curve("easeInOutCubic", { type = "bezier", points = {{0.65, 0}, {0.35, 1}} })
hl.curve("linear", { type = "bezier", points = {{0, 0}, {1, 1}} })
hl.curve("almostLinear", { type = "bezier", points = {{0.16, 1}, {0.3, 1}} })
hl.curve("quick", { type = "bezier", points = {{0.1, 0.9}, {0.2, 1}} })

hl.curve("easy", { type = "spring", mass = 1, stiffness = 180, dampening = 26 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 5, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 4, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 3, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 5, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 5, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 4, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 3, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 5, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 4, bezier = "easeOutQuint" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 6, bezier = "easeOutQuint" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

