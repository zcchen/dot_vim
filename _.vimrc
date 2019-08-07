set nocompatible

source ~/.vim/plugged.vim   " new vim-plugged manager

if v:version > 801
    packadd max_undo
endif

set autochdir       " change working dir when open files.
set modeline        " active the modeline

""=========== encoding =============
set fileencoding=utf-8 encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,big5,gb18030,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac
set formatoptions+=mMB
    " No space when joining two lines of Chinese together

" ========== VIM UI ==============
set number          " Display line number
set wrap            " Wrap lines
set mousehide       " Hide the mouse when typing text
set cmdheight=2     " Make command line 2 lines high
set showcmd         " Show the input command in status line
set cursorline      " make the entire line with underline
set scrolloff=3     " at least 3 rows below cursor
set splitright          " Open new on the right split
set ambiwidth=double    " set the char as double for CJK
" ---------- syntax -------
if !exists("syntax_on")
    syntax enable
endif
" ------------ fold method ------------
set foldenable          " 开始折叠
set foldmethod=indent   " 设置语法折叠
set foldcolumn=3        " 设置折叠区域的宽度
" -------- colorscheme ------------
set t_Co=256
set background=dark

" ========== VIM settings ===========
set history =50
set textwidth=80
" ------------ search ------------
set ignorecase
set smartcase       " Ignore case when searching
set incsearch       " 开启实时搜索
set hlsearch        " Switch on search pattern highlighting.
" ------------- indent ---------------
set autoindent      " 自动缩进
"set cindent         " 自动C语言缩进, TODO: add a new config file to handle it
" ---------- tab key ----------
set smarttab        " TODO: add a new config file to handle it
set list listchars=tab:>-,trail:∓    " 设置显示TAB以及行尾空格的标志
set shiftwidth=4    " 自动缩进插入的空格数
set tabstop=4       " tab width
set softtabstop=4   " 使用tab或bs自动插入或者删除相应的空格数
set expandtab       " 将tab展开成空格,而不是制表符
set showtabline=2   " always show tab line
" ---------- spell ---------
set spelllang =en_us       "if need more dictionaries, add more.
" ---------- developping --------
"set completeopt+=longest   "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"let c_comment_strings=1     "highlighting strings inside C comments

" ----------- autocmd -----------
"autocmd! InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
autocmd! bufwritepost .vimrc source $MYVIMRC    " auto reload vimrc
autocmd! BufReadPost *
            \   if line("'\"") > 1 && line("'\"") <= line("$")
            \|      exe "normal! g`\""
            \|  endif   " 打开文件后自动定位上次光标的位置
autocmd BufNewFile,BufEnter *.tmp set textwidth=0

source ~/.vim/set_plug.vim
source ~/.vim/keybinds.vim
