local M = {}

M.lazy = {
    spec = {
        {
            "numToStr/Comment.nvim",
            opts = {
                -- add any options here
            },
            lazy = false,
            config = function ()
                require('Comment').setup({
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
                })
            end,
        }
    },
    install = {},
}

return M
