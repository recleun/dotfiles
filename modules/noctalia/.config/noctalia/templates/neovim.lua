local M = {}

function M.setup()
    local colors = {
        base00 = "{{colors.surface.default.hex}}",
        base01 = "{{colors.surface_container_low.default.hex | lighten 5}}",
        base02 = "{{colors.surface_container_high.default.hex}}",
        base03 = "{{colors.outline.default.hex | lighten 5}}",
        base04 = "{{colors.on_surface.default.hex | darken 10}}",
        base05 = "{{colors.on_surface.default.hex | darken 5 }}",
        base06 = "{{colors.on_surface.default.hex}}",
        base07 = "{{colors.on_surface.default.hex | lighten 5}}",
        base08 = "{{colors.primary.default.hex}}",
        base09 = "{{colors.primary.default.hex | darken 20}}",
        base0A = "{{colors.primary.default.hex | darken 10}}",
        base0B = "{{colors.green.default.hex | desaturate 40}}",
        base0C = "{{colors.on_surface.default.hex}}",
        base0D = "{{colors.on_surface.default.hex | darken 10}}",
        base0E = "{{colors.primary.default.hex | darken 5}}",
        base0F = "{{colors.secondary.default.hex | darken 5}}",
    }

    require("base16-colorscheme").setup(colors)

    vim.api.nvim_set_hl(0, "Identifier",            { fg = colors.base05 })
    vim.api.nvim_set_hl(0, "@variable",             { fg = colors.base05 })
    vim.api.nvim_set_hl(0, "@variable.builtin",     { fg = colors.base08, italic = true })
    vim.api.nvim_set_hl(0, "@variable.member",      { fg = colors.base0D })
    vim.api.nvim_set_hl(0, "@variable.parameter",   { fg = colors.base05 })
    vim.api.nvim_set_hl(0, "@lsp.type.variable",    { fg = colors.base05 })

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

