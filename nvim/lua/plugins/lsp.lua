return {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { "BufReadPre", "BufNewFile", "LspAttach" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = {
        -- lsp management
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- improvements
        'lopi-py/luau-lsp.nvim',

        -- completions
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        'hrsh7th/cmp-path',
    },
    config = function()
        local lspconfig = require('lspconfig')
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { 'emmet_language_server', 'html', 'clangd', 'rust_analyzer', 'ts_ls', 'denols', 'lua_ls', 'pyright', 'eslint', 'wgsl_analyzer', 'jsonls', 'cssls', 'jdtls', 'luau_lsp', 'taplo' },
        })

        vim.lsp.config('denols', {
            root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
        })

        vim.lsp.config('ts_ls', {
            root_dir = lspconfig.util.root_pattern("package.json"),
            single_file_support = false,
        })

        vim.lsp.config('jsonls', {
            filetypes = { "json", "jsonc" },
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = {
                        {
                            fileMatch = {"package.json"},
                            url = "https://json.schemastore.org/package.json"
                        },
                        {
                            fileMatch = {"deno.json"},
                            url = "https://deno.land/x/deno@v2.0.4/cli/schemas/config-file.v1.json"
                        },
                        {
                            fileMatch = {"tsconfig*.json"},
                            url = "https://json.schemastore.org/tsconfig.json"
                        },
                        {
                            fileMatch = {
                                ".prettierrc",
                                ".prettierrc.json",
                                "prettier.config.json"
                            },
                            url = "https://json.schemastore.org/prettierrc.json"
                        },
                        {
                            fileMatch = {".eslintrc", ".eslintrc.json"},
                            url = "https://json.schemastore.org/eslintrc.json"
                        },
                        {
                            fileMatch = {"fastfetch/config.jsonc"},
                            url = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json"
                        },
                    }
                }
            }
        })

        local cmp = require('cmp')
        local luasnip = require('luasnip')

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
            mapping = {
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-y>"] = cmp.mapping.confirm(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        else
                            cmp.confirm({
                                select = true,
                            })
                        end
                    else
                        fallback()
                    end
                end),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-S-w>"] = cmp.mapping(function(fallback)
                    if luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-S-q>"] = cmp.mapping(function(fallback)
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })
    end
}
