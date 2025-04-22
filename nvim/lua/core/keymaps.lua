vim.g.mapleader = '\\'

local function map(mode, lhs, rhs, opts)
    local options = {
        noremap=true,
        silent=false
    }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- ----------- normal key maps -------------
map("", "<PageUp>", "<C-u>")
map("", "<PageDown>", "<C-d>")
map("", "j", "gj")
map("", "k", "gk")
map('i', "jk", "<ESC>")

map("n", "<leader>hlc", ':let @/ = ""<CR>', {silent=true})
map("n", "<leader>nu",  ':set number! <CR>')

-- -------- copy & paste ---------
vim.opt.pastetoggle = "<leader>pp"
-- copy
map('v', '<leader>cp', '"+y')
-- paste
map('i', "<C-S-v>", '<ESC>"+yi')
map('n', '<leader>pp', ':set paste<CR>"+gp<C-o>:set nopaste<CR>``', {silent=true})

-- -------- tabs & windows ----------
map("n", "<C-h>", '<C-w>h')
map("n", "<C-j>", '<C-w>j')
map("n", "<C-k>", '<C-w>k')
map("n", "<C-l>", '<C-w>l')
map("n", "<leader>vimrc", ":vsp $MYVIMRC <CR>")
