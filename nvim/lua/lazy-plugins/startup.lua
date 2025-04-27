return {
    {
        'goolord/alpha-nvim',
        dependencies = {
            'echasnovski/mini.icons',
            'nvim-lua/plenary.nvim'
        },
        config = function (_, opts)
            require('alpha').setup(
                    require('alpha.themes.theta').config
                )
        end
    },
}
