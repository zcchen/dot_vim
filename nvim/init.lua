require('core.options')
require('core.autocmd')
require('core.keymaps')
require('core.abbreviate')

g_path = {
    plugins = {
        rel = "plugins/"
    }
}
g_path.plugins.abs = vim.fn.stdpath("config") .. g_path.plugins.rel

require("manager.lazy")


vim.api.nvim_create_autocmd('BufWritePost', {   -- auto reload ~/.config/nvim/init.lua
    pattern = '$MYVIMRC',
    command = 'source $MYVIMRC'
})
