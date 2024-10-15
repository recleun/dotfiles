return {
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        config = function()
            require("github-theme").setup({
                options = {
                    transparent = true,
                    terminal_colors = false,
                },
            })
            vim.cmd.colorscheme("github_dark")
        end
    },
    {
        'navarasu/onedark.nvim',
        config = function()
            require("onedark").setup({
                options = {
                    transparent = true,
                },
            })
        end
    },
    {
        "tiagovla/tokyodark.nvim",
        config = function()
            require("tokyodark").setup({
                transparent_background = true,
            })
        end,
    }
}
