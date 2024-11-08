return {
    {
        enabled = false,
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
        enabled = true,
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            vim.cmd.colorscheme("kanagawa-dragon")
        end
    },
    {
        enabled = false,
        "AlexvZyl/nordic.nvim",
        lazy = false,
        config = function()
            require("nordic").load()
            vim.cmd.colorscheme("nordic")
        end
    },
}
