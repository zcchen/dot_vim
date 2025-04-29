local lang_list = {
    -- programming lang & relates
    "c", "cpp", "cmake", "make", "doxygen", "go", "c_sharp", "java", "kotlin",
    "python", "lua", "r", "ruby", "proto",
    -- script
    "bash", "powershell",
    -- Web-base
    "html", "css", "javascript", "typescript", "sql", "htmldjango", "jinja", "jinja_inline", "vue",
    -- configs
    "ini", "json", "markdown", "markdown_inline", "toml", "xml", "csv", "dockerfile",
    -- server-related
    "nginx", "vim", "vimdoc"
}

local treesitter_install_list = {}
for _, v in ipairs(lang_list) do
    treesitter_install_list = vim.list_extend(
        treesitter_install_list,
        {":TSInstall " .. v }
    )
end
--local parser_abspath = G_path.plugins.abs .. "nvim-treesitter_parsers/"

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = {":TSUpdate"},
        opts = {
            -- a list of parser names, or "all" (the listed parsers must always be installed)
            ensure_installed = lang_list,
            -- install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,
            -- automatically install missing parsers when entering buffer
            -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
            auto_install = true,
            ---- if you need to change the installation directory of the parsers (see -> advanced setup)
            --parser_install_dir = parser_abspath,
            highlight = {
                enable = true,
                -- note: these are the names of the parsers and not the filetype. (for example if you want to
                -- or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                disable = function(_, buf)
                    local max_filesize = 100 * 1024 -- 100 kb
                    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                -- setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- using this option may slow down your editor, and you may see some duplicate highlights.
                -- instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        },
        --config = function(_, opts)
            --if not vim.uv.fs_stat(parser_abspath) then
                --vim.uv.fs_mkdir(parser_abspath, tonumber('755', 8))
            --end
            --vim.opt.runtimepath:prepend(parser_abspath)
            --require("nvim-treesitter.configs").setup(opts)
        --end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "VeryLazy",
    },
}
