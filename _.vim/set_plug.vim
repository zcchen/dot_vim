" --------- UI setting ------------
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

" ------- tags setting --------
set tags=./.tags;,.tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"let g:gutentags_project_root += ['/usr/lib/python3/dist-packages']
let g:gutentags_exclude_project_root = [expand('~')]
let g:gutentags_ctags_exclude = ['*/dot_files/*']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_modules = ['ctags']
let g:gutentags_ctags_executable = 'ctags-universal'
"let g:gutentags_ctags_executable = 'ctags'
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--recurse']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" -----------syntax checker: ALE setting -----------
let &runtimepath.=',~/.vim/plugged/ale'
"let g:ale_sign_column_always = 1    " 一般需要实时检查，默认关闭
let g:ale_lint_on_save = 1          " save file auto check
let g:ale_lint_on_text_changed = 'normal'   " for ale_lint_on_save = 1
let g:ale_lint_on_enter = 0                 " for ale_lint_on_save = 1
"let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
highlight! clear SpellBad
highlight! clear SpellCap
highlight! clear SpellRare
highlight! SpellBad gui=undercurl guisp=red
highlight! SpellCap gui=undercurl guisp=blue
highlight! SpellRare gui=undercurl guisp=magenta

" ------------ YouCompleteMe ----------------
let g:ycm_python_binary_path = 'python3'    " if python 2, change 3 to 2
" 触发补全快捷键
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_auto_trigger = 1
let g:ycm_key_invoke_completion = '<Tab>'
" 最小自动触发补全的字符大小设置为 3
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
set completeopt=menu,menuone
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

" -------------- UltiSnips ---------------
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" ---------------- LeaderF -------------------
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
let g:Lf_CacheDirectory = expand('~/.cache/vim')
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

" ------------- echodoc.vim ------------
set cmdheight=2

