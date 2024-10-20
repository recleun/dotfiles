return {
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true,
        keys = {
            { "<leader>f" },
            { "<leader>st" },
            { "<leader>pl" },
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>f", builtin.find_files, {})
            vim.keymap.set("n", "<leader>st", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>pl", ":Telescope project<CR>")
            local telescope = require("telescope")
            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    },
                    ["project"] = {
                        base_dirs = { '~/dev/' },
                        cd_scope = { 'tab' },
                        hidden_files = true,
                    }
                }
            })
            telescope.load_extension("ui-select")
            telescope.load_extension("file_browser")
            telescope.load_extension("project")
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        lazy = true,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = true,
    },
    {
        "nvim-telescope/telescope-project.nvim",
        lazy = true,
    }
}
