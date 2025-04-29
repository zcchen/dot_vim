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
            "s1n7ax/nvim-window-picker"
        },
        ---@module "neo-tree"
        ---@type neotree.Config?
        opts = {
            -- fill any relevant options here
            source_selector = {
                winbar = false, -- toggle to show selector on winbar
                statusline = false, -- toggle to show selector on statusline
                show_scrolled_off_parent_node = false,  -- boolean
                sources = {                             -- table
                    {
                        source = "filesystem",          -- string
                        display_name = " 󰉓 Files "     -- string | nil
                    },
                    {
                        source = "buffers",             -- string
                        display_name = " 󰈚 Buffers "   -- string | nil
                    },
                    {
                        source = "git_status",          -- string
                        display_name = " 󰊢 Git ",      -- string | nil
                    },
                },
                content_layout = "start",       -- string
                tabs_layout = "equal",          -- string
                truncation_character = "…",    -- string
                tabs_min_width = nil,           -- int | nil
                tabs_max_width = nil,           -- int | nil
                padding = 0,
                -- int | { left: int, right: int }
                separator = { left = "▏", right= "▕" },
                -- string | { left: string, right: string, override: string | nil }
                separator_active = nil,
                -- string | { left: string, right: string, override: string | nil } | nil
                show_separator_on_edge = false,                           -- boolean
                highlight_tab = "NeoTreeTabInactive",                     -- string
                highlight_tab_active = "NeoTreeTabActive",                -- string
                highlight_background = "NeoTreeTabInactive",              -- string
                highlight_separator = "NeoTreeTabSeparatorInactive",      -- string
                highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
            },
            filesystem = {
                filtered_items = {
                    visible = false,
                        -- when true, they will just be displayed differently than normal items
                    hide_dotfiles = true,
                    hide_gitignored = false,
                    hide_hidden = true, -- only works on Windows for hidden files/directories
                    hide_by_name = {
                        ".DS_Store",
                        "thumbs.db",
                        --"node_modules",
                    },
                    hide_by_pattern = {
                        --"*.meta",
                        --"*/src/*/tsconfig.json",
                    },
                    always_show = { -- remains visible even if other settings would normally hide it
                        ".gitignored",
                    },
                    always_show_by_pattern = { -- uses glob style patterns
                        --".env*",
                    },
                    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                        --".DS_Store",
                        --"thumbs.db",
                    },
                    never_show_by_pattern = { -- uses glob style patterns
                        --".null-ls_*",
                    },
                },
            },
            default_component_configs = {
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "+",
                        deleted   = "-",
                        modified  = "✹",
                        renamed   = "󰁕",
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    }
                },
            },
        },
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
