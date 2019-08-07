"" -------- list and StatusLine -------------
"" if don't use powerline, it should be load
set foldcolumn=2
set ruler
set rulerformat=%m\%2c,%2v\ \ \ \ %p%%
set laststatus=2                        " Always show the statusline
set statusline=%m%r                     " right part of the status line.
set statusline+=%=                      " left part of the status line.
set statusline+=%-14.(%l,%3v%)\ %P      " show the cursor position.

set showmatch           " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2         " 短暂跳转到匹配括号的时间
