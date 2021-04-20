" vim plugin manager -- vim-plug
" https://github.com/junegunn/vim-plug
"
" '''''''''''''''''''''''''''''''''
" Make sure you use single quotes "
" '''''''''''''''''''''''''''''''''
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(expand($VIMHOME . '/plugged'))

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

" ====================== devel pack =====================
" general
Plug 'scrooloose/nerdcommenter'
if has('unix')
    Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'taxilian/a.vim'
if has('unix')
    if isdirectory('/usr/share/vim-youcompleteme')
        set runtimepath+=/usr/share/vim-youcompleteme
        let g:plugs.YouCompleteMe = {'uri': 'file:///usr/share/vim-youcompleteme', 'dir': '/usr/share/vim-youcompleteme', 'frozen': 0, 'branch': ''}
    else
        Plug 'Valloric/YouCompleteMe', { 'commit': 'd98f896', 'do': './install.py --clang-completer --system-libclang'}
    endif
endif
"NOTE: Use the YouCompleteMe plugin from distr provider
Plug 'w0rp/ale'
Plug 'Shougo/echodoc.vim'
Plug 'luochen1990/rainbow'
"Plug 'davidhalter/jedi-vim',    {'for': 'python'}
" snippets
Plug 'sirver/ultisnips'
"Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'Raimondi/YAIFA',          {'for': ['c', 'cpp', 'python']}

" ====================== syntax pack ====================
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
Plug 'aklt/plantuml-syntax'
Plug 'rhysd/vim-clang-format',                  { 'for': ['c', 'cpp'] }
Plug 'Glench/Vim-Jinja2-Syntax'

" ====================== files pack =====================
Plug 'mileszs/ack.vim'
if has('unix')
    Plug 'Yggdroot/LeaderF'
endif
Plug 'scrooloose/nerdtree'      | Plug 'Xuyuanp/nerdtree-git-plugin'

" ====================== UI pack ========================
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/Colour-Sampler-Pack'
Plug 'vim-airline/vim-airline'  | Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts',             {'do' : './install.sh'}
"Plug 'KevinGoodsell/vim-csexact'

" ====================== typing pack ====================
Plug 'tpope/vim-speeddating'
if has('unix')          " IM handling
    Plug 'lilydjwg/fcitx.vim'
endif
"Plug 'tpope/vim-sleuth'

" ====================== editor pack ====================
Plug 'Yggdroot/indentLine'      " indent
Plug 'thaerkh/vim-workspace'
Plug 'mhinz/vim-signify'        " diff 修改比较

" ====================== xdg pack =======================
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

" Initialize plugin system
call plug#end()
