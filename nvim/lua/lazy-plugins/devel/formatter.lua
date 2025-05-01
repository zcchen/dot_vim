return {
    {
        'stevearc/conform.nvim',
        opts = {
            default_format_opts = {
                lsp_format = "fallback",
            },
            format_on_save = { timeout_ms = 500 },
        },
        keys = {
            {
                "=",
                function()
                    require("conform").format({ async = true })
                end,
                mode = { "v", "n" },
                desc = "Format buffer",
            },
        },
    }
}
