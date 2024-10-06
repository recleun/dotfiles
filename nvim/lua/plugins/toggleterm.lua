return {
    {
        "akinsho/toggleterm.nvim",
        version = '*',
        lazy = false,
        config = function()
            require("toggleterm").setup({
                open_mapping = "<C-/>",
                direction = "float",
                float_opts = {
                    border = "curved",
                },
            })

            function _G.set_terminal_keymaps()
              local opts = {buffer = 0}
              vim.keymap.set('t', '<C-n>', [[<C-\><C-n>]], opts)
            end

            vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
        end
    }
}
