local lazy_dirname = "lazy.nvim"
local lazy_abspath = g_path.plugins.abs .. lazy_dirname

if not (vim.uv or vim.loop).fs_stat(lazy_abspath) then
    local path_pwd = vim.cmd("pwd")
    local path_config = vim.fn.stdpath("config")
    vim.cmd("cd " .. path_config)
    local out = vim.fn.system({
        "git", "submodule", "update", "--init", g_path.plugins.rel .. lazy_dirname
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

---- Setup lazy.nvim
require("lazy").setup({
    root = g_path.plugins.abs,
    defaults = {
        lazy = true,
        version = nil,
        cond = nil,
    },
    spec = g_plugins.lazy.spec,
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = g_plugins.lazy.install,
    -- automatically check for plugin updates
    checker = { enabled = true },
})
