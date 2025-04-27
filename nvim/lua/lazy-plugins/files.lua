return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        --branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            -- install nerd fonts from <https://github.com/ryanoasis/nerd-fonts>
            -- suggesting to download <https://github.com/ryanoasis/nerd-fonts/releases/latest/download/hack.tar.xz>
            -- After downloaded, copy and update fonts: `cp *.ttf ~/.local/share/fonts/ && fc-cache -fv`
            -- After set, let terminals use the downloaded nerd fonts.
            "MunifTanjim/nui.nvim",
        },
        ---@module "neo-tree"
        ---@type neotree.Config?
        opts = {
            -- fill any relevant options here
        },
        --config = function(_, opts)
            --require("neo-tree").setup(opts)
        --end,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        opts = {},
        --config = function(_, opts)
            --require("telescope").setup(opts)
        --end,
    },
}
