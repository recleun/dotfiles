vim.g.mapleader = " " -- leader, it's a space

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>") -- file explorer

vim.keymap.set("n", "<leader>cs", ':noh<cr>') -- clear search

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move text up and down when selected
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-a>", "ggVG<cr>") -- select all file contents

vim.keymap.set("v", "<C-c>", "\"+y") -- copy to system clipboard

vim.keymap.set("x", "<leader>p", "\"_dP") -- prevents overwriting clipboard when replacing text with print
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- changes all occurunces

vim.keymap.set("n", "<C-n>", vim.cmd.bnext)
vim.keymap.set("n", "<C-b>", vim.cmd.bprev)

-- terminal keybinds
local active_term = nil
vim.keymap.set({ "n", "t" }, "<C-/>", function()
    if active_term and vim.api.nvim_buf_is_valid(active_term) then
        local windows = vim.fn.win_findbuf(active_term)
        if #windows > 0 then
            vim.api.nvim_win_close(windows[1], false)
            return
        end
    end

    if active_term then
        vim.cmd("botright 8split")
        vim.api.nvim_win_set_buf(0, active_term)
    else
        vim.cmd("botright 8split | term")
        active_term = vim.api.nvim_get_current_buf()
    end

    vim.cmd("startinsert")
end)

vim.keymap.set("t", "<C-h>", "<C-\\><C-n>")

-- lazygit
vim.keymap.set("n", "<C-g>", function()
    local prev_buf = vim.api.nvim_get_current_buf()
    local term_buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_win_set_buf(0, term_buf)

    vim.fn.termopen("lazygit", {
    on_exit = function()
        if vim.api.nvim_buf_is_valid(term_buf) then
            vim.api.nvim_buf_delete(term_buf, { force = true })
        end

        if vim.api.nvim_buf_is_valid(prev_buf) then
            vim.api.nvim_win_set_buf(0, prev_buf)
        end
    end,
    })

    vim.cmd("startinsert")
end)

