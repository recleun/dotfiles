return {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        local wk = require("which-key")

        -- harpoon
        wk.add({
            {"<leader>h", group = "Harpoon"},
            {"<leader>ha", desc = "Add current file to harpoon"},
            {"<leader>hl", desc = "View currently harpooned files"},
            {"<leader>ht", desc = "View currently harpooned files with telescope"},
            {"<leader>hq", desc = "View buffer no. 1"},
            {"<leader>hw", desc = "View buffer no. 2"},
            {"<leader>he", desc = "View buffer no. 3"},
            {"<leader>hr", desc = "View buffer no. 4"},
            {"<leader>hn", desc = "Go to next buffer in list"},
            {"<leader>hb", desc = "Go to previous buffer in list"},
        })

        wk.add({
            {"<leader>r", group = "Rename"},
            {"<leader>rs", desc = "Rename Symbol"},
        })

        wk.add({
            {"<leader>g", group = "Go to"},
            {"<leader>gd", desc = "Go to definition"},
            {"<leader>gD", desc = "Go to declaration"},
            {"<leader>gr", desc = "Go to references"},
            {"<leader>gi", desc = "Go to implementation"},
        })

        wk.add({
            {"g", group = "Hover features"},
            {"gl", desc = "Show diagnostics"},
            {"gh", desc = "Show signature help"},
        })

        wk.add({
            { "<leader>e", desc = "Open file explorer" },
            { "<leader>f", desc = "Search for a file" },
            { "<leader>s", desc = "Rename all occurences/Search" },
        })

        wk.add({
            { "<leader>c", group = "Code/Crates/Clear" },
            { "<leader>cC", desc = "Open crates.io" },
            { "<leader>cD", desc = "Open crate documentation" },
            { "<leader>cH", desc = "Open crate homepage" },
            { "<leader>cR", desc = "Open crate repository" },
            { "<leader>cU", desc = "Upgrade crate" },
            { "<leader>cX", desc = "Extract crate to table" },
            { "<leader>ca", desc = "Code actions" },
            { "<leader>cd", desc = "List crate dependencies" },
            { "<leader>cf", desc = "List crate features" },
            { "<leader>cr", desc = "Reload crates.nvim" },
            { "<leader>cs", desc = "Clear search" },
            { "<leader>ct", desc = "Toggle crates.nvim" },
            { "<leader>cu", desc = "Update crate" },
            { "<leader>cv", desc = "List crate versions" },
            { "<leader>cx", desc = "Extract crate to inline table" },
        })

        wk.add({
            {
              mode = { "v" },
              { "<leader>c", group = "Update with crates.nvim" },
              { "<leader>cU", desc = "Upgrade crates" },
              { "<leader>cu", desc = "Update crates" },
              { "<leader>p", desc = "Print without overwriting clipboard" },
            },
        })
    end
}
