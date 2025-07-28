return {
    'xiyaowong/transparent.nvim',
    lazy = false,
    config = function()
        require("transparent").setup({
            extra_groups = {
                "GitSignsAdd",
                "GitSignsChange",
                "GitSignsDelete",
                "DiagnosticSignError",
                "DiagnosticSignHint",
                "DiagnosticSignInfo",
                "DiagnosticSignOk",
                "DiagnosticSignWarn",
            }
        })
    end,
}
