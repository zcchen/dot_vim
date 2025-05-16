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
            close_if_last_window = true,
            open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
            window = {
                position = "current",
            },
            source_selector = {
                winbar = false, -- toggle to show selector on winbar
                statusline = false, -- toggle to show selector on statusline
                show_scrolled_off_parent_node = false, -- boolean
                sources = { -- table
                    {
                        source = "filesystem", -- string
                        display_name = " 󰉓 Files " -- string | nil
                    },
                    {
                        source = "buffers", -- string
                        display_name = " 󰈚 Buffers " -- string | nil
                    },
                    {
                        source = "git_status", -- string
                        display_name = " 󰊢 Git ", -- string | nil
                    },
                },
                content_layout = "start", -- string
                tabs_layout = "equal", -- string
                truncation_character = "…", -- string
                tabs_min_width = nil, -- int | nil
                tabs_max_width = nil, -- int | nil
                padding = 0,
                -- int | { left: int, right: int }
                separator = { left = "▏", right = "▕" },
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
                indent = {
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└ ",
                    indent_size = 2,
                },
            },
        },
        config = function(_, opts)
            require("neo-tree").setup(opts)
            vim.api.nvim_create_autocmd(
                { "BufEnter", "BufWinEnter" },
                {
                    pattern = { "neotree *", "neo-tree *" },
                    callback = function()
                        vim.opt_local.foldenable = false
                    end
                })
        end,
    },
    {
        "doums/rg.nvim",
        opts = {
            -- Optional function to be used to format the items in the
            -- quickfix window (:h 'quickfixtextfunc')
            qf_format = nil,
            -- Glob list of excluded files and directories when the special
            -- `e` flag is set (it uses the `--glob !*` flag of rg)
            excluded = {
                '.idea',
                'node_modules',
                '.git',
                'target',
                'package-lock.json',
                'Cargo.lock',
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
    {
        "zcchen/dotenv.nvim",
        opts = {
            enable_on_load = false, -- will load your .env file upon loading a buffer
            verbose = false,         -- show error notification if .env file is not found and if .env is loaded
            -- file_name = '.env' -- will override the default file name '.env'
        },
        config = function(_, opts)
            local dotenv = require("dotenv")
            dotenv.setup(opts)
            local proxy_file_set = vim.fn.expand("~/.profile.d/proxy-set.env")
            local proxy_file_cls = vim.fn.expand("~/.profile.d/proxy-cls.env")
            local bufwin_filetypes = {
                "mason", "lazy"
            }
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function()
                    local is_matched = false
                    local curr_ft = vim.bo.filetype
                    for _, v in ipairs(bufwin_filetypes) do
                        local v_expand = v .. ".*"
                        if string.match(curr_ft, v_expand) then
                            is_matched = true
                            break
                        end
                    end
                    if is_matched then
                        dotenv.load(proxy_file_set)
                    else
                        dotenv.load(proxy_file_cls)
                    end
                end,
            })
        end,
    },
}
