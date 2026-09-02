local M = {}

function M.setup()
    local colors = {
        base00 = "{{colors.surface.default.hex}}",
        base01 = "{{colors.surface_container_low.default.hex | lighten 5}}",
        base02 = "{{colors.surface_container_high.default.hex}}",
        base03 = "{{colors.outline.default.hex}}",
        base04 = "{{colors.outline.default.hex | lighten 15}}",
        base05 = "{{colors.secondary.default.hex | darken 10}}",
        base06 = "{{colors.secondary.default.hex | lighten 5}}",
        base07 = "{{colors.on_surface.default.hex | darken 10}}",
        base08 = "{{colors.primary.default.hex | lighten 10}}",
        base09 = "{{colors.primary.default.hex | darken 20}}",
        base0A = "{{colors.primary.default.hex | darken 10}}",
        base0B = "{{colors.green.default.hex | desaturate 40}}",
        base0C = "{{colors.tertiary.default.hex | lighten 10}}",
        base0D = "{{colors.primary.default.hex | lighten 5}}",
        base0E = "{{colors.primary.default.hex | darken 5}}",
        base0F = "{{colors.tertiary.default.hex | darken 5}}",
    }

    -- base00 = '#171c19'
    -- base01 = '#232a25'
    -- base02 = '#526057'
    -- base03 = '#5f6d64'
    -- base04 = '#78877d'
    -- base05 = '#87928a'
    -- base06 = '#dfe7e2'
    -- base07 = '#ecf4ee'
    -- base08 = '#b16139'
    -- base09 = '#9f713c'
    -- base0A = '#a07e3b'
    -- base0B = '#489963'
    -- base0C = '#1c9aa0'
    -- base0D = '#478c90'
    -- base0E = '#55859b'
    -- base0F = '#867469'

    -- base00 = '#1e0528'
	-- base01 = '#1a092d'
	-- base02 = '#331354'
	-- base03 = '#320f55'
    -- base04 = '#873582'
	-- base05 = '#ffeeff'
	-- base06 = '#ffeeff'
	-- base07 = '#f8c0ff'
    -- base08 = '#00d9e9'
	-- base09 = '#aa00a3'
	-- base0A = '#955ae7'
	-- base0B = '#05cb0d'
    -- base0C = '#b900b1'
	-- base0D = '#550068'
	-- base0E = '#8991bb'
	-- base0F = '#4d6fff'

    require("base16-colorscheme").setup(colors)

    -- vim.api.nvim_set_hl(0, "Identifier",            { fg = colors.base05 })
    -- vim.api.nvim_set_hl(0, "@variable",             { fg = colors.base05 })
    -- vim.api.nvim_set_hl(0, "@variable.builtin",     { fg = colors.base08, italic = true })
    -- vim.api.nvim_set_hl(0, "@variable.member",      { fg = colors.base0D })
    -- vim.api.nvim_set_hl(0, "@variable.parameter",   { fg = colors.base05 })
    -- vim.api.nvim_set_hl(0, "@lsp.type.variable",    { fg = colors.base05 })

    local border = "{{colors.outline_variant.default.hex}}"

    vim.api.nvim_set_hl(0, "TelescopeBorder",       { fg = border })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = border })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle",  { fg = colors.base0D, bold = true })
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.base0E })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.base0E })

    vim.api.nvim_set_hl(0, "BufferCurrent",     { fg = colors.base08 })
    vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = colors.base08 })
end

vim.uv.new_signal():start("sigusr1", vim.schedule_wrap(function()
    package.loaded["noctalia"] = nil
    require("noctalia").setup()
    vim.cmd("TransparentToggle")
    vim.cmd("TransparentToggle")
end))

return M

