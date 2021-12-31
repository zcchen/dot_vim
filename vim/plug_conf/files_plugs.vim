if has_key(g:plugs, 'LeaderF')
    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    let g:Lf_ShortcutB = '<c-p>'
    let g:Lf_ShortcutF = '<c-n>'
    noremap <c-n> :LeaderfMru<cr>
    noremap <m-p> :LeaderfFunction<cr>
    noremap <m-n> :LeaderfBuffer<cr>
    noremap <m-m> :LeaderfTag<cr>
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand($HOME . '/.cache/vim')
    let g:Lf_ShowRelativePath = 0
    let g:Lf_HideHelp = 1
    let g:Lf_StlColorscheme = 'powerline'

    let g:Lf_NormalMap = {
        \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'],
        \            ["<F6>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'] ],
        \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'],
        \            ["<F6>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'] ],
        \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
        \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
        \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
        \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
        \ }
endif
