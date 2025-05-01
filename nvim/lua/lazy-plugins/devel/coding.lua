return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
        },
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {
        },
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "User FilePost",
        opts = {
        },
    },
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
                default = { "lsp", "path", "snippets", "buffer", },
                providers = {
                    --[[ path = {
                        name = "path",
                        module = "blink.cmp.sources.path",
                        enabled = true,
                        score_offset = 3,
                        opts = {
                            trailing_slash = false,
                            label_trailing_slash = true,
                            get_cwd = function(ctx)
                                return vim.fn.expand(("#%d:p:h").format(ctx.bufnr))
                            end,
                        },
                        should_show_items = true,
                    }, ]]
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
            },
        },
        opts_extend = { "sources.default" },
    }
}
