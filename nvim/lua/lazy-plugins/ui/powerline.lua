return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            options = {
                theme = "auto",
                component_separators = { left = "|", right = "|" },
                icons_enabled = false,
            },
        },
        --config = function (_, opts)
            --require("lualine").setup(opts)
        --end,
    },
}
