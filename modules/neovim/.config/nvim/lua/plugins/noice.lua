return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        presets = {
            lsp_doc_border = true,
        }
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
