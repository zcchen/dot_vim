local M = {}

M.lazy = {
    spec = {
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
            keys = {
                {
                    "<leader>?",
                    function()
                        require("which-key").show({ global = false })
                    end,
                    desc = "Buffer Local Keymaps (which-key)",
                },
            },
            init = function()
                require("which-key").add({
                        -- File / Find group
                        { "<leader>f", group = "Telescope / Files" },
                        { "<leader>ff", "<cmd>Telescope find_files<cr>",desc = "Find File", mode = "n" },
                        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", mode = "n" },
                        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers", mode = "n" },
                        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find nvim help tags", mode = "n" },
                        -- Comments
                        { "<leader>c", group = "Comments"},
                        -- windows
                        { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
                        { "<leader>b", group = "buffers", expand = function()
                                return require("which-key.extras").expand.buf()
                            end
                        },
                        {
                            -- Nested mappings are allowed and can be added in any order
                            -- Most attributes can be inherited or overridden on any level
                            -- There's no limit to the depth of nesting
                            mode = { "n", "v" }, -- NORMAL and VISUAL mode
                            { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
                            { "<leader>Z", "<cmd>w<cr>", desc = "Write" },
                        }
                    })
            end,
        }
    },
    install = {},
}

return M

