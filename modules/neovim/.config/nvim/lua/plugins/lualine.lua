return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "SmiteshP/nvim-navic",
    },
    lazy = false,
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = "auto",
                section_separators = { left = "||" },
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {
                    {
                        "filename",
                        color = {
                            fg = vim.api.nvim_get_hl(0, { name = "Normal" }),
                        }
                    }
                },
                lualine_b = {
                    {
                        "navic",
                        color_correction = "dynamic",
                    }
                },
                lualine_c = {},
                lualine_x = { 'filetype' },
                lualine_y = { 'searchcount', 'selectioncount' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
            },
        }
    end
}
