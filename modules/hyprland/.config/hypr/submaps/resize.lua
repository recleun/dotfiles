return {
    init = function(mainMod)
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
    end,
}
