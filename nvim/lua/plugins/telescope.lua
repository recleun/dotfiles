return {
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
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
                        -- on_project_selected = function(prompt_bufnr)
                        --     -- :Ex directory doesn't change after selecting new project
                        --     -- Harpoon list gets cleared after selecting new project
                        --     -- Try adding project with global scope
                        --     local project_actions = require("telescope._extensions.project.actions")
                        --     project_actions.change_working_directory(prompt_bufnr)
                        --     require("harpoon"):list():select(1)
                        -- end
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
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-telescope/telescope-project.nvim",
    }
}
