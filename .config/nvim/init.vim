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

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

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

" Markdown
let g:vim_markdown_math=1
let g:vim_markdown_strikethrough=1
let g:vim_markdown_auto_insert_bullets=0
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks = 0

" ===============================================
" Plugins key bindings
" ===============================================

" UltiSnips
let g:UltiSnipsExpandTrigger="<leader>s"

" ===============================================
" Common
" ===============================================

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

" Show matching brackets.
set showmatch

" Autosave
set autowrite

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

" ===============================================
" Custom key bindings.
" ===============================================

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
nnoremap [j J

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

" Don't close split on bd.
command! Bd bp\|bd \#

