return {
    {
        "numToStr/Comment.nvim",
        opts = {
            ---LHS of toggle mappings in NORMAL mode
            toggler = {
                ---Line-comment toggle keymap
                line = '<leader>cc',
                ---Block-comment toggle keymap
                block = '<leader>cb',
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = '<leader>cc',
                ---Block-comment keymap
                block = '<leader>cb',
            },
            ---LHS of extra mappings
            extra = {
                ---Add comment on the line above
                above = '<leader>cO',
                ---Add comment on the line below
                below = '<leader>co',
                ---Add comment at the end of line
                eol = '<leader>cA',
            },
            ---Enable keybindings
            ---NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                ---Operator-pending mapping; the `opleader` above
                basic = true,
                ---Extra mapping; the `extra` above
                extra = true,
            },
        },
    },
}
