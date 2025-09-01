local lazy_dirname = "lazy.nvim"
local plugin_dirname = "lazy-plugins"

-- install lazy.nvim if not existed.
local lazy_abspath = G_path.plugins.abs .. lazy_dirname
if not vim.uv.fs_stat(lazy_abspath) then
    local path_pwd = vim.cmd("pwd")
    local path_config = vim.fn.stdpath("config")
    vim.cmd("cd " .. path_config)
    local out = vim.fn.system({
        "git", "submodule", "update", "--init", G_path.plugins.rel .. lazy_dirname
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
                { "Failed to git submodule lazy.nvim:\n", "ErrorMsg" },
                { out, "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
    vim.cmd("cd " .. path_pwd)
end
vim.opt.rtp:prepend(lazy_abspath)

-- define the `spec` param table with the `import` key by finding the dirs automatically.
local import_dirnames = { {import = plugin_dirname} }
local plugin_dirname_abs = vim.fn.stdpath("config") .. "/lua/" .. plugin_dirname
for _, dir_or_file in ipairs(vim.fn.readdir(plugin_dirname_abs)) do
    if vim.fn.isdirectory(plugin_dirname_abs .. "/" .. dir_or_file) ~= 0 then
        import_dirnames = vim.list_extend(import_dirnames,
            { {import = plugin_dirname .. "/" .. dir_or_file} }
        )
    end
end

---- Setup lazy.nvim
require("lazy").setup({
    root = G_path.plugins.abs,
    defaults = {
        lazy = false,
        version = nil,
        cond = nil,
    },
    spec = vim.list_extend({
        },
        import_dirnames
    ),
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = {},
    -- automatically check for plugin updates
    -- checker = { enabled = true },
    checker = { enabled = false },
})
