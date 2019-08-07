" vim plugin manager -- vim-plug
" https://github.com/junegunn/vim-plug
"
" '''''''''''''''''''''''''''''''''
" Make sure you use single quotes "
" '''''''''''''''''''''''''''''''''
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ------------------ example below ----------------------
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
"
" ------------------ example above ----------------------

" completing helper
"Plug 'davidhalter/jedi-vim',    {'for': 'python'}
Plug 'Valloric/YouCompleteMe',  {'do' : './install.py --clang-completer --system-libclang'}

" find str
Plug 'mileszs/ack.vim'

" date
Plug 'tpope/vim-speeddating'

" IM
Plug 'lilydjwg/fcitx.vim'

" file pluggin
Plug 'Yggdroot/LeaderF'
Plug 'scrooloose/nerdtree'      | Plug 'Xuyuanp/nerdtree-git-plugin'

" commenter
Plug 'scrooloose/nerdcommenter'

" ctags
Plug 'ludovicchabant/vim-gutentags'
Plug 'taxilian/a.vim'

" UI
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/Colour-Sampler-Pack'
Plug 'vim-airline/vim-airline'  | Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts',             {'do' : './install.sh'}
" indent
Plug 'Yggdroot/indentLine'

" Preview
Plug 'tyru/open-browser.vim'

" diff 修改比较
Plug 'mhinz/vim-signify'

" snippets
Plug 'sirver/ultisnips'
"Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Syntax Helper
Plug 'w0rp/ale'
Plug 'Shougo/echodoc.vim'
Plug 'luochen1990/rainbow'

" Syntaxes
"Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'othree/html5.vim',                        { 'for': 'html' }
Plug 'vim-scripts/nginx.vim',                   { 'for': 'nginx' }
Plug 'othree/javascript-libraries-syntax.vim',  { 'for': 'javascript'}
Plug 'tbastos/vim-lua',                         { 'for': 'lua' }
Plug 'octol/vim-cpp-enhanced-highlight',        { 'for': ['c', 'cpp'] }
Plug 'justinmk/vim-syntax-extra',               { 'for': ['c', 'bison', 'flex', 'cpp'] }
Plug 'vim-python/python-syntax',                { 'for': ['python'] }
Plug 'elzr/vim-json',                           { 'for': 'json' }
Plug 'dyng/ctrlsf.vim'
Plug 'kylef/apiblueprint.vim'
Plug 'gi1242/vim-tex-syntax',                   { 'for': ['tex', 'latex'] }
Plug 'vhdirk/vim-cmake'

" Undo Trees
Plug 'mbbill/undotree'

" PlantUML
"Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'

Plug 'thaerkh/vim-workspace'

" Initialize plugin system
call plug#end()
