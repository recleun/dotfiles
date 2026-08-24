return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        indent = { enabled = true },
        notifier = { enabled = true },
        scroll = { enabled = true },
        dim = {
            scope = {
                min_size = 30,
                max_size = 30,
                siblings = true,
            },
        },
        words = { enabled = true },
        dashboard = {
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "projects", title = "Projects", indent = 2, padding = 2 },
                { section = "startup" },
            },
        },
    },
    init = function()
        local snacks = require("snacks")

        snacks.dim()

        vim.keymap.set("n", "<leader>do", function() snacks.dashboard.open() end)
        vim.keymap.set("n", "<A-q>", function() snacks.bufdelete() end)
    end,
}

