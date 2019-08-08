if has_key(g:plugs, 'Colour-Sampler-Pack')
    let g:molokai_original=1
    colorscheme molokai
    let g:MolokaiTransp_On = 0
    "autocmd! BufReadPost,ColorScheme,VimEnter,WinEnter *
    "            \ call MolokaiTransp(g:MolokaiTransp_On)
    if !exists(g:colors_name)
        highlight cursorline guibg=lightblue
        highlight Normal guibg=grey90
        highlight Cursor guibg=Green guifg=NONE
        highlight lCursor guibg=Cyan guifg=NONE
        highlight NonText guibg=grey80
        highlight Constant gui=NONE guibg=grey95
        highlight Special gui=NONE guibg=grey95
    endif
    let g:airline_powerline_fonts = 1
    let g:airline_theme='molokai'
endif

