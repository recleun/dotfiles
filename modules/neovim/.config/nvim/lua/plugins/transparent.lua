return {
    'xiyaowong/transparent.nvim',
    lazy = false,
    config = function()
        local transparent = require("transparent")
        transparent.setup({
            extra_groups = {
                "GitSignsAdd",
                "GitSignsChange",
                "GitSignsDelete",
                "DiagnosticSignError",
                "DiagnosticSignHint",
                "DiagnosticSignInfo",
                "DiagnosticSignOk",
                "DiagnosticSignWarn",

                "TabLineFill",

                "StatusLine",
                "StatusLineNC",
                "lualine_a_normal",
                "lualine_b_normal",
                "lualine_c_normal",
                "lualine_a_insert",
                "lualine_b_insert",
                "lualine_c_insert",
                "lualine_a_visual",
                "lualine_b_visual",
                "lualine_c_visual",
                "lualine_a_replace",
                "lualine_b_replace",
                "lualine_c_replace",
                "lualine_a_command",
                "lualine_b_command",
                "lualine_c_command",
                "lualine_a_inactive",
                "lualine_b_inactive",
                "lualine_c_inactive",
            }
        })

        transparent.clear_prefix("Buffer")
        transparent.clear_prefix("Navic")
        transparent.clear_prefix("lualine")
        transparent.clear_prefix("Telescope")
    end,
}

