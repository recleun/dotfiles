return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
        "nvim-mini/mini.icons",
    },
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
            },
        })
    end,
}
