" Disable vi compatibility.
set nocompatible

" Set <leader>
nnoremap <Space> <nop>
let mapleader=' '

"
" Common
"

colorscheme pablo

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

" Enable spelling
set spell
set spelllang=en,ru

" Relative line numbering
set rnu

"
" Custom key bindings.
"

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Do not close a window on :bd
nnoremap <leader>q :b#<Bar>bd#<CR>

" Move half screen more conveniently
nnoremap <C-j> 5<C-e>
nnoremap <C-k> 5<C-y>

" Clears the search register
nnoremap <silent> <leader>; :nohlsearch<CR>

" Fix last error.
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Format paragraph
nnoremap <leader>= vipgq

nnoremap <leader>/ :ls<CR>

" Buffers
nnoremap <leader>o :b#<CR>

let s:conf_files = [
      \ 'plugins.vim',
      \ 'ide.vim',
      \ ]
for s:fname in s:conf_files
    let s:full_fname = printf('%s/%s', stdpath('config'), s:fname)
    if filereadable(s:full_fname)
        execute 'source' s:full_fname
    endif
endfor
