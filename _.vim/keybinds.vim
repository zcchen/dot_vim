let mapleader = '\'

inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"回车即选中当前项

map <PageUp> <C-u>
map <PageDown> <C-d>
map j gj
map k gk
inoremap jk <ESC>
map <silent> <leader>hlc :let @/ = ""<CR>
map <leader>nu  :call NumberToggle() <CR>

" -------- copy & paste ---------
set pastetoggle=<leader>pp
"map <leader>pp <leader>pp````
map <leader>cp  "+y
imap <C-S-v>    <ESC>"+yi
    " copy selected texts to clipboard
imap <S-Insert> <C-o>"+gp
nmap <silent> <leader>pp :set paste<CR>"+gp<C-o>:set nopaste<CR>``
" -------- tabs & windows ----------
nnoremap <C-h> <C-w>h|        "<C-w>_<C-w>10-
nnoremap <C-j> <C-w>j|        "<C-w>_<C-w>10-
nnoremap <C-k> <C-w>k|        "<C-w>_<C-w>10-
nnoremap <C-l> <C-w>l|        "<C-w>_<C-w>10-
nnoremap <leader>vimrc :vsp $MYVIMRC <CR>
" -------- count the char ----------
noremap <leader>count :wa\|!texcount % -ch

" ---------- 日期/时间的快速插入 -------
iab <expr> today_\ strftime("%Y-%m-%d")
iab <expr> day_\ strftime("%A")
iab <expr> time_\ strftime("%T (%Z)")
if has('python')
    py import uuid
    iab <expr> uuid_\ pyeval('str(uuid.uuid4())')
endif
