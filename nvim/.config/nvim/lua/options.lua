local g = vim.g
local opt = vim.opt

g.mapleader = ' '

-- Hide launch screen.
opt.shortmess:append('I')

-- Maximum width of text that is being inserted.
opt.textwidth = 79

-- Set the search scan so that it ignores case when the search is all lower
-- case but recognizes uppercase if it's specified.
opt.ignorecase = true
opt.smartcase = true

-- Number of spaces to use for each step of (auto)indent.
opt.shiftwidth = 4
opt.shiftround = true
-- Use spaces insted of tabs.
opt.expandtab = true
-- Copy the previous indentation on autoindenting.
opt.copyindent = true

-- Keep lines off the edges of the screen when scrolling.
opt.scrolloff = 10

-- Display some characters.
opt.list = true
opt.listchars = { tab = '▸ ', trail = '·', extends = '#', nbsp = '·' }

-- Don't use swapfile.
g.noswapfile = true

-- Show line number.
opt.number = true

-- Show line number.
opt.laststatus = 0

-- Hide INSERT status.
opt.showmode = false

-- Always show sign column.
opt.signcolumn = 'yes:1'

-- Use mouse
opt.mouse = 'a'

-- Open new windows at bottom and right.
opt.splitbelow = true
opt.splitright = true

-- Limit popup menu height.
opt.pumheight = 20

-- Highlight current line.
opt.cursorline = true

-- Enable spelling.
opt.spell = true
opt.spelllang = { 'en', 'ru' }

-- Relative line numbering.
opt.rnu = true

-- Colors
vim.cmd([[ set t_8f=^[[38;2;%lu;%lu;%lum ]])
vim.cmd([[ set t_8b=^[[48;2;%lu;%lu;%lum ]])
opt.termguicolors = true

-- Set a title of a terminal
opt.title = true

-- Netrw.
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_browse_split = 4
g.netrw_altv = 0
g.netrw_winsize = 25

-- Make C-O working properly inside a buffer.
vim.cmd [[
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]]
