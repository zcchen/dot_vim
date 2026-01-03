if has_key(g:plugs, 'Colour-Sampler-Pack') || has_key(g:plugs, "molokai")
    colorscheme molokai
    let g:molokai_original = 1
    " let g:rehash256 = 1
    let g:MolokaiTransp_On = 0
    let g:airline_powerline_fonts = 1
    let g:airline_theme='molokai'
    " set t_Co=256
    " set background=dark
endif

if has_key(g:plugs, 'space-vim-theme')
    colorscheme space_vim_theme
endif
