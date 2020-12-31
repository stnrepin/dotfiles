" Vim config.
" ===============================================

" Disable vi compatibility.
set nocompatible

filetype off

" ===============================================
" Plugins
" ===============================================

call plug#begin('~/.vim/plugged')

" Color scheme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Keyboard switcher.
Plug 'lyokha/vim-xkbswitch'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Highlight
Plug 'justinmk/vim-syntax-extra'
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp', 'c']}

" Easymotion
Plug 'easymotion/vim-easymotion'

" Markdown
Plug 'godlygeek/tabular', {'for': 'markdown' }
Plug 'plasticboy/vim-markdown', {'for': 'markdown' }
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" Latex
Plug 'lervag/vimtex', {'for': 'latex' }

" Center text in Vim
Plug 'junegunn/goyo.vim'

" Terminal in Vim
Plug 'kassio/neoterm'

" Surround
Plug 'tpope/vim-surround'

" Vim GPG
Plug 'jamessan/vim-gnupg'

call plug#end()

filetype indent plugin on

" ===============================================
" Plugins config
" ===============================================

" Color scheme
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme onehalfdark

" Keyboard switcher.
let g:XkbSwitchEnabled=1
let g:XkbSwitchLib='/usr/lib/libxkbswitch.so'
let g:XkbSwitchIMappings=['ru']

" UltiSnips
let g:UltiSnipsSnippetDirectories=[
    \ $HOME.'/.vim/UltiSnips',
    \ $HOME.'/.vim/plugged/vim-snippets/UltiSnips'
\ ]

" Markdown
let g:vim_markdown_math=1
let g:vim_markdown_strikethrough=1
let g:vim_markdown_auto_insert_bullets=0
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_frontmatter=1
let g:instant_markdown_mathjax=1
let g:instant_markdown_autostart=0
let g:instant_markdown_browser="electron"

" Latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Neoterm
let g:neoterm_default_mod='edit'
autocmd TermOpen *neoterm* setlocal nospell

" ===============================================
" Plugins key bindings
" ===============================================

" UltiSnips
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" Easymotion
map <Space> <Plug>(easymotion-prefix)

" ===============================================
" Common
" ===============================================

" Hide launch screen.
set shortmess+=I

" Default encoding.
set termencoding=utf-8
set encoding=utf-8

" Make the command-line completion better.
set wildmenu

" Automatically reload files changed outside of Vim.
set autoread

" Make the keyboard fast.
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50

" Set width to 79 columns.
set textwidth=79

" Don't beep.
set visualbell
set noerrorbells
set vb t_vb=

" Set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified.
set ignorecase
set smartcase

" Set size of tab.
set tabstop=4
set shiftwidth=4
set shiftround
" Use spaces instead of tabs.
set expandtab
" Always set autoindenting on.
set autoindent
" Copy the previous indentation on autoindenting.
set copyindent

" Don't close buffers.
set hidden
" Use already opened files from the quickfix window instead of opening new
" buffers
set switchbuf=useopen

" Keep lines off the edges of the screen when scrolling.
set scrolloff=10

" Display some characters.
set list
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

" Don't use swapfile.
set noswapfile

" Show line number.
set number

" Change default status line.
set statusline=%=%P\ %f\ %m
" Don't show status line.
set laststatus=0
" Hide INSERT status.
set noshowmode

" Show matching brackets.
set showmatch

" Autosave
"set autowrite

" Always show sign column
set signcolumn=yes

" Use mouse
set mouse=a

" Open new windows at bottom and right
set splitbelow
set splitright

" Limit popup menu height
set pumheight=20

" Highlight current line.
set cursorline

" Don't show preview window
set completeopt-=preview

" Make the path to the file always relative.
autocmd BufReadPost * silent! lcd .

" Enable spelling
set spell
set spelllang=en,ru

" Relative line numbering
set rnu

" ===============================================
" Custom commands.
" ===============================================

" Custom buffer commands
:command -nargs=1 B b <args>
:command -nargs=1 Bs vertical sb <args>
:command -nargs=1 Bd bd <args>

" ===============================================
" Custom key bindings.
" ===============================================

" Set <leader>
let mapleader="["

" Use the damn hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Clears the search register
nnoremap <silent> <leader><leader> :nohlsearch<CR>

" Quick moving by text.
nnoremap J 5j
nnoremap K 5k

" Concatenate the current line with below
nnoremap <leader>j J

" Map ^
nnoremap - ^

" Fix last error.
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Show the list of buffers before :b command
nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <leader>B :ls<CR>:B<Space>

" Easy paste from  "0
nnoremap <leader>p "0p
nnoremap <leader>P "0P

" Format paragraph
nnoremap <leader>q vipgq
