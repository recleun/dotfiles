vim.g.mapleader = " " -- leader, it's a space

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>") -- file explorer

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- center cursor when going up and down
vim.keymap.set("n", "<C-u>", "<C-u>zz")

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

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, rhs, lhs)
          vim.keymap.set(mode, rhs, lhs, {buffer = event.buf})
        end

        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        bufmap('n', '<leader>rs', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
        bufmap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    end,
})
