return {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    ft = "markdown",
    config = function()
        vim.fn["mkdp#util#install"]()
    end,
}
