return {
    {
        "akinsho/toggleterm.nvim",
        version = '*',
        lazy = true,
        config = function()
            require("toggleterm").setup({
                open_mapping = "<C-/>",
                direction = "float",
                float_opts = {
                    border = "curved",
                },
            })

            -- keybind to open lazygit
            vim.keymap.set("n", "<C-g>", ":TermExec cmd=lazygit<cr>")

            function _G.set_terminal_keymaps()
              local opts = {buffer = 0}
              vim.keymap.set('t', '<C-n>', [[<C-\><C-n>]], opts)
            end

            vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
        end
    }
}
