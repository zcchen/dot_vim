if has_key(g:plugs, 'fcitx.vim')
    set timeout ttimeoutlen=100
    if !empty(glob("/usr/bin/fcitx5-remote"))
        let g:fcitx5_remote = "fcitx5-remote"
    else
        let g:fcitx5_remote = "fcitx-remote"
    endif
endif

