" Vim config.
"

" Disable vi compatibility.
set nocompatible

filetype off

" =======
" Plugins
" =======

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle.
Plugin 'VundleVim/Vundle.vim'

" https://github.com/plasticboy/vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Keyboard switcher.
Plugin 'lyokha/vim-xkbswitch'

call vundle#end()
filetype plugin on

" =======
" Plugins config
" =======

" Keyboard switcher.
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so'
let g:XkbSwitchIMappings = ['ru']

" Vim-markdown
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_auto_insert_bullets = 0

" =======
" Common
" =======

" Hide launch screen.
set shortmess+=I 

" Default encoding.
set termencoding=utf-8
set encoding=utf8

" Make the command-line completion better.
set wildmenu

" Automatically reload files changed outside of Vim.
set autoread

" Make the keyboard fast.
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50

" Set width to 79 colums.
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
" Use already opened files from the quikfix window instead of opening new
" buffers
set switchbuf=useopen

" Keep lines off the edges of the screen when scrolling.
set scrolloff=5

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

" Use system clipdoard 
set clipboard=unnamedplus

" Show matching brackets.
set showmatch 

" =======
" Custom key bindigs.
" =======

noremap ; :

" Use the damn hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Clears the search register
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Quick moving by text.
nnoremap J 5j
nnoremap K 5k

" Use Shift-H and Shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

"Don't overwrite clipboard on deleting.
noremap dd "_dd
noremap D "_D
noremap d "_d
noremap X "_X
noremap x "_x
xnoremap <leader>p "_dP

" Open autocomplete menu by Ctr+Space.
" inoremap <Nul> <C-n>

" Buffers switch.
function! ChangeBuf(cmd)

    if (&modified && &modifiable)
        execute ":w"
    endif
    execute a:cmd
endfunction
nnoremap <silent> <C-o> :call ChangeBuf(":b#")<CR>
nnoremap <silent> <C-n> :call ChangeBuf(":bn")<CR>
nnoremap <silent> <C-p> :call ChangeBuf(":bp")<CR>
