vim.opt.autochdir = true    -- change working dir when open files.
vim.opt.modeline = true     -- active the modeline

-- =========== encoding =============
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8,ucs-bom,cp936,big5,gb18030,euc-jp,euc-kr,latin1"
if vim.fn.has('win32') or vim.fn.has('win64') then
    vim.opt.fileformats = dos,unix
else
    vim.opt.fileformats = unix,dos
end
vim.opt.formatoptions = vim.opt.formatoptions + "mMB"

-- ========== VIM UI ==============
vim.opt.number = true           -- Display line number
vim.opt.wrap = true             -- Wrap lines
vim.opt.mousehide = true        -- Hide the mouse when typing text
vim.opt.cmdheight = 2           -- Make command line 2 lines high
vim.opt.showcmd = true          -- Show the input command in status line
vim.opt.cursorline = true       -- make the entire line with underline
vim.opt.scrolloff = 3           -- at least 3 rows below cursor
vim.opt.splitright = true       -- Open new on the right split
vim.opt.ambiwidth = "double"    -- set the char as double for CJK
-- ---------- syntax -------
if not vim.fn.exists("syntax_on") then
    vim.cmd("syntax enable")
end
vim.opt.conceallevel = 0        -- Text is shown normally
-- ------------ fold method ------------
vim.opt.foldenable = true       -- 开始折叠
vim.opt.foldmethod = "indent"   -- 设置语法折叠
vim.opt.foldcolumn = "3"        -- 设置折叠区域的宽度
-- -------- colorscheme ------------
vim.opt.background = "dark"

-- ========== VIM settings ===========
vim.opt.history = 50
vim.opt.textwidth = 100
-- ------------ search ------------
vim.opt.ignorecase = true
vim.opt.smartcase = true        -- Ignore case when searching
vim.opt.incsearch = true        -- 开启实时搜索
vim.opt.hlsearch = true         -- Switch on search pattern highlighting.
-- ------------- indent ---------------
vim.opt.autoindent = true       -- 自动缩进
--vim.opt.cindent = true          -- 自动C语言缩进, TODO: add a new config file to handle it
-- ---------- tab key ----------
vim.opt.smarttab = true                 -- TODO: add a new config file to handle it
vim.opt.listchars = {
    -- 设置显示TAB以及行尾空格的标志
    tab = ">-",
    trail = "∓"
}
vim.opt.list = true
vim.opt.expandtab =true                 -- 将tab展开成空格,而不是制表符
vim.opt.shiftwidth = 4                  -- 自动缩进插入的空格数
vim.opt.tabstop = 4                     -- tab width
vim.opt.softtabstop = 4                 -- 使用tab或bs自动插入或者删除相应的空格数
vim.opt.showtabline = 2                 -- always show tab line
-- ---------- backspace key ----------
-- vim.opt.backspace = "indent,start,eol"
-- ---------- spell ---------
vim.opt.spelllang = "en_us"             --if need more dictionaries, add more.
