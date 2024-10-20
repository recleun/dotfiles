return  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    event = "BufReadPre",
    config = function()
        vim.opt.termguicolors = true
        require("colorizer").setup()
    end
}
