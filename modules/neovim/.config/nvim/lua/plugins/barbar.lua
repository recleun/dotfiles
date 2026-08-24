return {
    "romgrk/barbar.nvim",
    opts = {
        animation = true,
        auto_hide = 1,
        clickable = false,
        exclude_name = {
            "fish",
        },
        focus_on_close = "right",
        icons = {
            buffer_index = true,
            buffer_number = false,
            current = { button = "" },
            inactive = { button = "" },
        },
        insert_at_end = true,
        maximum_padding = 1,
        minimum_padding = 1,
    },
    init = function()
        vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
        vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
        vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
        vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
        vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
        vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
        vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
        vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
        vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
        vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>")

        vim.keymap.set("n", "<C-l>", "<Cmd>BufferMoveNext<CR>")
        vim.keymap.set("n", "<C-h>", "<Cmd>BufferMovePrevious<CR>")

        vim.g.barbar_auto_setup = false
    end,
}

