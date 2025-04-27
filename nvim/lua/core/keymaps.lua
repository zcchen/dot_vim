vim.g.mapleader = '\\'

local r = require("utils.remaps")

-- ----------- normal key maps -------------
r.map({""}, "<PageUp>", "<C-u>")
r.map({""}, "<PageDown>", "<C-d>")
r.map({""}, "j", "gj")
r.map({""}, "k", "gk")
r.map({'i'}, "jk", "<ESC>")

r.map({"n"}, "<leader>hlc", ':let @/ = ""<CR>', {silent=true})
r.map({"n"}, "<leader>nu",  ':set number! <CR>')

-- -------- copy & paste ---------
--vim.opt.pastetoggle = "<leader>pp"
-- copy
r.map({'v'}, '<leader>cp', '"+y')
-- paste
r.map({'i'}, "<C-S-v>", '<ESC>"+yi')
r.map({'n'}, '<leader>pp', ':set paste<CR>"+gp<C-o>:set nopaste<CR>``', {silent=true})

-- -------- tabs & windows ----------
r.map({"n"}, "<C-h>", '<C-w>h')
r.map({"n"}, "<C-j>", '<C-w>j')
r.map({"n"}, "<C-k>", '<C-w>k')
r.map({"n"}, "<C-l>", '<C-w>l')
r.map({"n"}, "<leader>vimrc", ":vsp $MYVIMRC <CR>")
