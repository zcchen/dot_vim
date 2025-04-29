return {
    --[[ {
        "fabius/molokai.nvim",
        dependencies = "rktjmp/lush.nvim",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme " .. "molokai")
        end,
    }, ]]
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end,
    }
}
