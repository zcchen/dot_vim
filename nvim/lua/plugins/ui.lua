local M = {}

M.lazy = {
    spec = {
        {
            "fabius/molokai.nvim",
            dependencies = "rktjmp/lush.nvim",
            lazy = false,
            priority = 1000,
            init = function()
                vim.cmd("colorscheme " .. "molokai")
            end,
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = {
                'nvim-tree/nvim-web-devicons'
            },
        },
    },
    install = {},
}

return M
