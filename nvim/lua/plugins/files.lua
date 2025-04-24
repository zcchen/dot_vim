local M = {}

M.lazy = {
    spec = {
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
            },
            lazy = false, -- neo-tree will lazily load itself
            ---@module "neo-tree"
            ---@type neotree.Config?
            opts = {
                -- fill any relevant options here
            },
            config = function()
                require("neo-tree").setup()
            end,
        },
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' },
            lazy = false,
            config = function()
                require("telescope").setup()
            end,
        },
    },
    install = {},
}

return M
