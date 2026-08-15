return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        {
            "saghen/blink.cmp",
            version = "v1",
            opts = {
                keymap = {
                    preset = "none",
                    ["<C-j>"] = { "select_next", "fallback" },
                    ["<C-k>"] = { "select_prev", "fallback" },
                    ["<Tab>"] = { "accept", "fallback" },
                },
                appearance = {
                    nerd_font_variant = "mono"
                },
                completion = { documentation = { auto_show = false } },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                },
                fuzzy = { implementation = "prefer_rust_with_warning" }
            },
            opts_extend = { "sources.default" }
        }
    },
    config = function()
        local enabled = {
            "clangd",
            "lua_ls",
        }

        vim.lsp.enable(enabled)

        local navic = require("nvim-navic")
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("LspConfig", { clear = true }),
            callback = function(args)

                local client = vim.lsp.get_client_by_id(args.data.client_id)

                if client and client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, args.buf)
                end

                vim.keymap.set("n", "K", vim.lsp.buf.hover)
                vim.keymap.set("n", "gr", vim.lsp.buf.references)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
                vim.keymap.set("n", "<leader>rs", vim.lsp.buf.rename)
                vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
                vim.keymap.set({ "n", "x" }, "<F3>", function()
                    vim.lsp.buf.format({ async = true })
                end)
                vim.keymap.set("n", "gl", vim.diagnostic.open_float)
                vim.keymap.set("n", "gh", vim.lsp.buf.signature_help)
            end,
        })
    end
}

