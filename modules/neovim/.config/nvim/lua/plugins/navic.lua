return {
    "SmiteshP/nvim-navic",
    config = function()
        local navic = require("nvim-navic")

        navic.setup({
            highlight = true,
            lsp = {
                auto_attach = true,
            },
        })

        vim.api.nvim_set_hl(0, "NavicIconsFile",      { link = "Identifier" })
        vim.api.nvim_set_hl(0, "NavicIconsModule",    { link = "Include" })
        vim.api.nvim_set_hl(0, "NavicIconsNamespace", { link = "Type" })
        vim.api.nvim_set_hl(0, "NavicIconsPackage",   { link = "Type" })
        vim.api.nvim_set_hl(0, "NavicIconsClass",     { link = "Type" })
        vim.api.nvim_set_hl(0, "NavicIconsMethod",    { link = "Function" })
        vim.api.nvim_set_hl(0, "NavicIconsProperty",  { link = "Identifier" })
        vim.api.nvim_set_hl(0, "NavicIconsField",     { link = "Identifier" })
        vim.api.nvim_set_hl(0, "NavicIconsConstructor",{ link = "Function" })
        vim.api.nvim_set_hl(0, "NavicIconsEnum",      { link = "Type" })
        vim.api.nvim_set_hl(0, "NavicIconsInterface", { link = "Type" })
        vim.api.nvim_set_hl(0, "NavicIconsFunction",  { link = "Function" })
        vim.api.nvim_set_hl(0, "NavicIconsVariable",  { link = "Identifier" })
        vim.api.nvim_set_hl(0, "NavicIconsConstant",  { link = "Constant" })
    end,
}
