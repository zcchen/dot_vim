if !exists('$VIMHOME')
    if has('win32') || has ('win64')
        let $VIMHOME = expand($VIM . "/vimfiles")
    else
        let $VIMHOME = expand($HOME . "/.vim")
    endif
endif

if has("persistent_undo")   " Persistent undo
    if !exists('g:max_undo_dir')
        let s:undo_dir = expand($VIMHOME . '/undodir')
    else
        let s:undo_dir = g:max_undo_dir
    endif

    if !isdirectory(s:undo_dir)
       silent! call mkdir(s:undo_dir, 'p')
    endif

    let &undodir = s:undo_dir
    set undofile
    set undolevels=10000
        "maximum number of changes that can be undone
    set undoreload=10000
        "maximum number lines to save for undo on a buffer reload
else
    set noundofile
endif

