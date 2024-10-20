return {
    {
        "akinsho/toggleterm.nvim",
        version = '*',
        lazy = true,
        keys = {
            { "<C-/>" },
        },
        config = function()
            require("toggleterm").setup({
                open_mapping = "<C-/>",
                direction = "float",
                float_opts = {
                    border = "curved",
                },
            })

            vim.keymap.set("n", "<C-/>", ":ToggleTerm dir=\"%:p:h\"<CR>")

            function _G.set_terminal_keymaps()
                local opts = {buffer = 0}
                vim.keymap.set('t', '<C-n>', [[<C-\><C-n>]], opts)
            end

            vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
        end
    }
}
