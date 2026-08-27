return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    init = function()
        local languages = {
            "lua",
            "vim",
            "vimdoc",
            "c",
            "cpp",
            "javascript",
            "typescript",
            "python",
            "json",
            "bash",
            "markdown",
        }

        require("nvim-treesitter").install(languages)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = languages,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
