return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- File / Find group
            { "<leader>f", group = "Telescope / Files" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>",desc = "Find File", mode = "n" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", mode = "n" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers", mode = "n" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find nvim help tags", mode = "n" },
            -- Comments
            --{ "<leader>c", group = "Comments"},
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
            },
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
        config = function(_, opts)
            require("which-key").add(opts)
        end,
    }
}
