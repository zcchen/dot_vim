return {
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = {
            'L3MON4D3/LuaSnip',
            "xzbdmw/colorful-menu.nvim",
            "onsails/lspkind.nvim",
        },

        -- use a release tag to download pre-built binaries
        --version = "*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- See the full "keymap" documentation for information on defining your own keymap.
            keymap = {
                preset = "super-tab",
                -- ["<tab>"] = { "show", 'snippet_forward', 'fallback' },
                -- ["<esc>"] = { "hide", 'fallback' },
                -- ['<C-l>'] = { 'show', 'show_documentation', 'hide_documentation' },
                -- ['<C-h>'] = { 'show_signature', 'hide_signature', 'fallback' }
            },

            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- Will be removed in a future release
                use_nvim_cmp_as_default = true,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                --nerd_font_variant = "mono",
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer", "ripgrep" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },
            cmdline = {
                enabled = true,
            },
            snippets = { preset = 'luasnip' },
            completion = {
                menu = {
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label",    "label_description", gap = 1 },
                        },
                        components = {
                            label = {
                                text = function(ctx)
                                    return require("colorful-menu").blink_components_text(ctx)
                                end,
                                highlight = function(ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end,
                            },
                            kind_icon = {
                                text = function(ctx)
                                    local icon = ctx.kind_icon
                                    if vim.tbl_contains({ "path" }, ctx.source_name) then
                                        local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                        if dev_icon then
                                            icon = dev_icon
                                        else
                                            icon = require("lspkind").symbolic(ctx.kind, {
                                                mode = "symbol",
                                            })
                                        end
                                    end

                                    return icon .. ctx.icon_gap
                                end,

                                -- optionally, use the highlight groups from nvim-web-devicons
                                -- you can also add the same function for `kind.highlight` if you want to
                                -- keep the highlight groups in sync with the icons.
                                highlight = function(ctx)
                                    local hl = ctx.kind_hl
                                    if vim.tbl_contains({ "path" }, ctx.source_name) then
                                        local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                        if dev_icon then
                                            hl = dev_hl
                                        end
                                    end
                                    return hl
                                end,
                            }
                        },
                    }
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                },
                trigger = {
                    show_in_snippet = false,
                },
                list = {
                    selection = {
                        preselect = function(_)
                            return not require('blink.cmp').snippet_active({ direction = 1 })
                        end,
                        auto_insert = function(_)
                            local skip_ft = {
                                "markdown.*"
                            }
                            local ft = vim.bo.filetype
                            for _, v in pairs(skip_ft) do
                                if ft == v then
                                    return false
                                end
                            end
                            return true
                        end,
                    },
                },
            },
        },
        opts_extend = { "sources.default" },
    },
    {
        "saghen/blink.cmp",
        dependencies = {
            "mikavilpas/blink-ripgrep.nvim",
            -- 👆🏻👆🏻 add the dependency here

            -- optional dependency used for toggling features on/off
            -- https://github.com/folke/snacks.nvim
            "folke/snacks.nvim",
        },
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            sources = {
                default = {
                    "buffer",
                    "ripgrep", -- 👈🏻 add "ripgrep" here
                },
                providers = {
                    -- 👇🏻👇🏻 add the ripgrep provider config below
                    ripgrep = {
                        module = "blink-ripgrep",
                        name = "Ripgrep",
                        -- the options below are optional, some default values are shown
                        ---@module "blink-ripgrep"
                        ---@type blink-ripgrep.Options
                        -- opts = {
                        --     -- For many options, see `rg --help` for an exact description of
                        --     -- the values that ripgrep expects.
                        --
                        --     -- the minimum length of the current word to start searching
                        --     -- (if the word is shorter than this, the search will not start)
                        --     prefix_min_len = 3,
                        --
                        --     -- The number of lines to show around each match in the preview
                        --     -- (documentation) window. For example, 5 means to show 5 lines
                        --     -- before, then the match, and another 5 lines after the match.
                        --     context_size = 5,
                        --
                        --     -- The maximum file size of a file that ripgrep should include in
                        --     -- its search. Useful when your project contains large files that
                        --     -- might cause performance issues.
                        --     -- Examples:
                        --     -- "1024" (bytes by default), "200K", "1M", "1G", which will
                        --     -- exclude files larger than that size.
                        --     max_filesize = "1M",
                        --
                        --     -- Specifies how to find the root of the project where the ripgrep
                        --     -- search will start from. Accepts the same options as the marker
                        --     -- given to `:h vim.fs.root()` which offers many possibilities for
                        --     -- configuration. If none can be found, defaults to Neovim's cwd.
                        --     --
                        --     -- Examples:
                        --     -- - ".git" (default)
                        --     -- - { ".git", "package.json", ".root" }
                        --     project_root_marker = { ".git" },
                        --
                        --     -- Enable fallback to neovim cwd if project_root_marker is not
                        --     -- found. Default: `true`, which means to use the cwd.
                        --     project_root_fallback = true,
                        --
                        --     -- The casing to use for the search in a format that ripgrep
                        --     -- accepts. Defaults to "--ignore-case". See `rg --help` for all the
                        --     -- available options ripgrep supports, but you can try
                        --     -- "--case-sensitive" or "--smart-case".
                        --     search_casing = "--ignore-case",
                        --
                        --     -- (advanced) Any additional options you want to give to ripgrep.
                        --     -- See `rg -h` for a list of all available options. Might be
                        --     -- helpful in adjusting performance in specific situations.
                        --     -- If you have an idea for a default, please open an issue!
                        --     --
                        --     -- Not everything will work (obviously).
                        --     additional_rg_options = {},
                        --
                        --     -- When a result is found for a file whose filetype does not have a
                        --     -- treesitter parser installed, fall back to regex based highlighting
                        --     -- that is bundled in Neovim.
                        --     fallback_to_regex_highlighting = true,
                        --
                        --     -- Absolute root paths where the rg command will not be executed.
                        --     -- Usually you want to exclude paths using gitignore files or
                        --     -- ripgrep specific ignore files, but this can be used to only
                        --     -- ignore the paths in blink-ripgrep.nvim, maintaining the ability
                        --     -- to use ripgrep for those paths on the command line. If you need
                        --     -- to find out where the searches are executed, enable `debug` and
                        --     -- look at `:messages`.
                        --     ignore_paths = {},
                        --
                        --     -- Any additional paths to search in, in addition to the project
                        --     -- root. This can be useful if you want to include dictionary files
                        --     -- (/usr/share/dict/words), framework documentation, or any other
                        --     -- reference material that is not available within the project
                        --     -- root.
                        --     additional_paths = {},
                        --
                        --     -- Keymaps to toggle features on/off. This can be used to alter
                        --     -- the behavior of the plugin without restarting Neovim. Nothing
                        --     -- is enabled by default. Requires folke/snacks.nvim.
                        --     toggles = {
                        --         -- The keymap to toggle the plugin on and off from blink
                        --         -- completion results. Example: "<leader>tg"
                        --         on_off = nil,
                        --     },
                        --
                        --     -- Features that are not yet stable and might change in the future.
                        --     -- You can enable these to try them out beforehand, but be aware
                        --     -- that they might change. Nothing is enabled by default.
                        --     future_features = {
                        --         backend = {
                        --             -- The backend to use for searching. Defaults to "ripgrep".
                        --             -- Available options:
                        --             -- - "ripgrep", always use ripgrep
                        --             -- - "gitgrep", always use git grep
                        --             -- - "gitgrep-or-ripgrep", use git grep if possible, otherwise
                        --             --   ripgrep
                        --             use = "ripgrep",
                        --         },
                        --     },
                        --
                        --     -- Show debug information in `:messages` that can help in
                        --     -- diagnosing issues with the plugin.
                        --     debug = false,
                        -- },
                        -- (optional) customize how the results are displayed. Many options
                        -- are available - make sure your lua LSP is set up so you get
                        -- autocompletion help
                        transform_items = function(_, items)
                            for _, item in ipairs(items) do
                                -- example: append a description to easily distinguish rg results
                                item.labelDetails = {
                                    description = "(rg)",
                                }
                            end
                            return items
                        end,
                    },
                },
                keymap = {
                    -- 👇🏻👇🏻 (optional) add a keymap to invoke the search manually
                    ["<leader>rg"] = {
                        function()
                            -- invoke manually, requires blink >v0.8.0
                            require("blink-cmp").show({ providers = { "ripgrep" } })
                        end,
                    },
                },
            },
        }
    },
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "benfowler/telescope-luasnip.nvim",
        },
        --event = "InsertEnter",
        config = function(_, opts)
            local luasnip = require("luasnip")
            luasnip.setup({
                region_check_events = "CursorHold,InsertLeave",
                -- those are for removing deleted snippets, also a common problem
                delete_check_events = "TextChanged,InsertEnter",
            })
            require("luasnip.loaders.from_lua").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load()
            --vim.tbl_map(
            --function(t)
            --require("luasnip.loaders.from_" .. t).lazy_load()
            --end,
            --{ "vscode", "snipmate", "lua" }
            --)
            -- friendly-snippets - enable standardized comments snippets
            luasnip.filetype_extend("typescript", { "tsdoc" })
            luasnip.filetype_extend("javascript", { "jsdoc" })
            luasnip.filetype_extend("lua", { "luadoc" })
            luasnip.filetype_extend("python", { "pydoc" })
            luasnip.filetype_extend("rust", { "rustdoc" })
            luasnip.filetype_extend("cs", { "csharpdoc" })
            luasnip.filetype_extend("java", { "javadoc" })
            luasnip.filetype_extend("c", { "cdoc" })
            luasnip.filetype_extend("cpp", { "cppdoc" })
            luasnip.filetype_extend("php", { "phpdoc" })
            luasnip.filetype_extend("kotlin", { "kdoc" })
            luasnip.filetype_extend("ruby", { "rdoc" })
            luasnip.filetype_extend("sh", { "shelldoc" })
            -- add keymaps
            vim.cmd([[
                " press <Tab> to expand or jump in a snippet. These can also be mapped separately
                " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
                imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
                snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
                " -1 for jumping backwards.
                inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
                snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
            ]])
        end,
    },
}
