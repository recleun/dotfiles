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
}
