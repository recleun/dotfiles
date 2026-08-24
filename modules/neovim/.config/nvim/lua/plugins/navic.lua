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

        local function set_navic_highlights()
            vim.api.nvim_set_hl(0, "NavicIconsFile",          { link = "Identifier" })
            vim.api.nvim_set_hl(0, "NavicIconsModule",        { link = "Include" })
            vim.api.nvim_set_hl(0, "NavicIconsNamespace",     { link = "Type" })
            vim.api.nvim_set_hl(0, "NavicIconsPackage",       { link = "Type" })
            vim.api.nvim_set_hl(0, "NavicIconsClass",         { link = "Type" })
            vim.api.nvim_set_hl(0, "NavicIconsMethod",        { link = "Function" })
            vim.api.nvim_set_hl(0, "NavicIconsProperty",      { link = "Identifier" })
            vim.api.nvim_set_hl(0, "NavicIconsField",         { link = "Identifier" })
            vim.api.nvim_set_hl(0, "NavicIconsConstructor",   { link = "Function" })
            vim.api.nvim_set_hl(0, "NavicIconsEnum",          { link = "Type" })
            vim.api.nvim_set_hl(0, "NavicIconsInterface",     { link = "Type" })
            vim.api.nvim_set_hl(0, "NavicIconsFunction",      { link = "Function" })
            vim.api.nvim_set_hl(0, "NavicIconsVariable",      { link = "Identifier" })
            vim.api.nvim_set_hl(0, "NavicIconsConstant",      { link = "Constant" })
            vim.api.nvim_set_hl(0, "NavicIconsString",        { link = "String" })
            vim.api.nvim_set_hl(0, "NavicIconsNumber",        { link = "Number" })
            vim.api.nvim_set_hl(0, "NavicIconsBoolean",       { link = "Boolean" })
            vim.api.nvim_set_hl(0, "NavicIconsArray",         { link = "Constant" })
            vim.api.nvim_set_hl(0, "NavicIconsObject",        { link = "Type" })
            vim.api.nvim_set_hl(0, "NavicIconsKey",           { link = "Identifier" })
            vim.api.nvim_set_hl(0, "NavicIconsNull",          { link = "Constant" })
            vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    { link = "Constant" })
            vim.api.nvim_set_hl(0, "NavicIconsStruct",        { link = "Type" })
            vim.api.nvim_set_hl(0, "NavicIconsEvent",         { link = "Special" })
            vim.api.nvim_set_hl(0, "NavicIconsOperator",      { link = "Operator" })
            vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { link = "Type" })
            vim.api.nvim_set_hl(0, "NavicText",               { link = "Normal" })
            vim.api.nvim_set_hl(0, "NavicSeparator",          { link = "Comment" })
        end

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = set_navic_highlights,
        })

        set_navic_highlights()
    end,
}

