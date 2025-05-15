local lsp_configs = {
    clangd = {},
    lua_ls = {
        settings = {
            Lua = {
                workspace = {
                    checkThirdParty = false,
                    -- Make the server aware of Neovim runtime files
                    library = {
                        vim.env.VIMRUNTIME,
                    },
                },
                codeLens = {
                    enable = true,
                },
                completion = {
                    callSnippet = "Replace",
                },
                doc = {
                    privateName = { "^_" },
                },
                hint = {
                    enable = true,
                    setType = false,
                    paramType = true,
                    paramName = "Disable",
                    semicolon = "Disable",
                    arrayIndex = "Disable",
                },
            },
        },
    },
    pylsp = {
        settings = {
            pylsp = {
                plugins = {
                    -- formatter options
                    black = { enabled = true },
                    autopep8 = { enabled = false },
                    yapf = { enabled = false },
                    -- linter options
                    pylint = {
                        enabled = true,
                        executable = "pylint",
                        args = {
                            "--disable=missing-function-docstring",
                            "--disable=missing-class-docstring",
                            "--disable=missing-module-docstring",
                            "--disable=invalid-name",
                            "--rcfile",
                            vim.fs.find(
                                { "pyproject.toml", ".pylintrc", "setup.py", ".git" },
                                { upward = true, limit = 8 }
                            ),
                        },
                    },
                    ruff = { enabled = false },
                    pyflakes = { enabled = false },
                    pycodestyle = {
                        enabled = false,
                        ignore = {
                            "W391",
                        },
                        maxLineLength = 100,
                    },
                    -- type checker
                    pylsp_mypy = {
                        enabled = true,
                        report_progress = true,
                        live_mode = false
                    },
                    -- auto-completion options
                    jedi_completion = { fuzzy = true },
                    -- import sorting
                    isort = { enabled = true },
                },
            },
        },
    },
    docker_compose_language_service = {},
    dockerls = {},
    jinja_lsp = {
        filetypes = { "jinja" },
    },
    -- curlylint = {},
}
local function lsp_post_configure()
    -- Add jinja2 related extension
    vim.filetype.add({
        extension = {
            jinja = "jinja",
            jinja2 = "jinja",
            j2 = "jinja",
        },
    })
end

return {
    {
        "williamboman/mason.nvim",
        opts = {
            install_root_dir = G_path.plugins.abs .. "mason_pkgs/",
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
        --config = function(_, opts)
        --end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = {
            -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
            -- This setting has no relation with the `automatic_installation` setting.
            ---@type string[]
            ensure_installed = vim.tbl_keys(lsp_configs),

            -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
            -- This setting has no relation with the `ensure_installed` setting.
            -- Can either be:
            --   - false: Servers are not automatically installed.
            --   - true: All servers set up via lspconfig are automatically installed.
            --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
            --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
            ---@type boolean
            automatic_installation = true, -- default is false

            -- See `:h mason-lspconfig.setup_handlers()`
            ---@type table<string, fun(server_name: string)>?
            handlers = nil,
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        opts = {
            -- options for vim.diagnostic.config()
            ---@type vim.diagnostic.Opts
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "●",
                    -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                    -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
                    -- prefix = "icons",
                },
                severity_sort = true,
            },
            -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
            -- Be aware that you also will need to properly configure your LSP server to
            -- provide the inlay hints.
            inlay_hints = {
                enabled = true,
                -- exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
            },
            -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
            -- Be aware that you also will need to properly configure your LSP server to
            -- provide the code lenses.
            codelens = {
                enabled = false,
            },
            -- add any global capabilities here
            capabilities = {
                workspace = {
                    fileOperations = {
                        didRename = true,
                        willRename = true,
                    },
                },
            },
            -- options for vim.lsp.buf.format
            -- `bufnr` and `filter` is handled by the LazyVim formatter,
            -- but can be also overridden when specified
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
        },
        config = function(_, opts)
            vim.lsp.config("*", opts)
            for k, v in pairs(lsp_configs) do
                vim.lsp.enable(k)
                vim.lsp.config(k, v)
            end
            lsp_post_configure()
        end,
    },
    --[[ {
        "nvimtools/none-ls.nvim",
        config = function(_, opts)
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.completion.spell,
                    null_ls.builtins.diagnostics.djlint,
                    -- require("null-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
                    null_ls.builtins.formatting.prettier.with({
                        filetypes = { "html", "json", "yaml", "markdown" },
                        extra_filetypes = { "toml", "jinja2" },
                    }),
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })
        end,
    }, ]]
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
