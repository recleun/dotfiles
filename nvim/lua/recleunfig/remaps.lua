vim.g.mapleader = " " -- leader, it's a space

vim.keymap.set("n", "<leader>e", vim.cmd.Ex) -- file explorer

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- center cursor when going up and down
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>cs", ':noh<cr>') -- clear search

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move text up and down when selected
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "<C-c>", "\"+y") -- copy to system clipboard

vim.keymap.set("x", "<leader>p", "\"_dP") -- prevents overwriting clipboard when replacing text with print
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- changes all occurunces

vim.keymap.set("n", "<leader>sr", "<C-Minus>")
