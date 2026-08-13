return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "BufReadPre",
    config = function()
        require("ibl").setup()
    end
}
