vim.g.mapleader = " " -- leader, it's a space

vim.keymap.set("n", "<leader>e", vim.cmd.Ex) -- file explorer

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

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, rhs, lhs)
          vim.keymap.set(mode, rhs, lhs, {buffer = event.buf})
        end

        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        bufmap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        bufmap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap('n', '<leader>rs', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
        bufmap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    end,
})
