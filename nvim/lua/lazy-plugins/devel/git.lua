return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add          = { text = '+' },
                delete       = { text = '-' },
                change       = { text = '✹' },
                topdelete    = { text = 'd' },
                changedelete = { text = 'x' },
                untracked    = { text = '?' },
            },
            signs_staged = {
                add          = { text = '+' },
                delete       = { text = '-' },
                change       = { text = '✹' },
                topdelete    = { text = 'd' },
                changedelete = { text = 'x' },
                untracked    = { text = '?' },
            },
            signs_staged_enable = true,
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
            linehl     = true, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                follow_files = true
            },
        },
        config = function(_, opts)
            require('gitsigns').setup(opts)
        end
    },
}
