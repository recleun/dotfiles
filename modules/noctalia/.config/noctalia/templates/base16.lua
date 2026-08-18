return {
    "RRethy/base16-nvim",
    config = function()
        local ok, noctalia = pcall(require, "noctalia")
        if ok then noctalia.setup() end
    end,
}

