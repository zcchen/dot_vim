local lazypath = g_path.plugins.rel .. "lazy.nvim"
local lazyrepo = "https://github.com/folke/lazy.nvim.git"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local path_pwd = vim.cmd("pwd")
    local path_config = vim.fn.stdpath("config")
    vim.cmd("cd " .. path_config)
    local out = vim.fn.system({
        "git", "submodule", "update", "--init", lazypath
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
vim.opt.rtp:prepend(lazypath)

---- Setup lazy.nvim
--require("lazy").setup({
        --spec = {
            ---- import your plugins
            --{ import = "plugins" },
        --},
        ---- Configure any other settings here. See the documentation for more details.
        ---- colorscheme that will be used when installing plugins.
        --install = { colorscheme = { "habamax" } },
        ---- automatically check for plugin updates
        --checker = { enabled = true },
    --})
