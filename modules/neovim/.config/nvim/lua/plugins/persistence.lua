return {
    "folke/persistence.nvim",
    lazy = true,
    event = "BufReadPre",
    config = function()
        local persistence = require("persistence")
        persistence.setup({})

        vim.keymap.set("n", "<leader>sl", function() persistence.load() end)
        vim.keymap.set("n", "<leader>ss", function() persistence.select() end)
    end,
}

