" Vim config.
" ===============================================

" Disable vi compatibility.
set nocompatible

filetype off

" ===============================================
" Plugins
" ===============================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Color scheme
Bundle 'sonph/onehalf', {'rtp': 'vim/'}

" Vundle.
Plugin 'VundleVim/Vundle.vim'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Keyboard switcher.
Plugin 'lyokha/vim-xkbswitch'

" Autocompletion
Plugin 'Valloric/YouCompleteMe'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Hightlight
Plugin 'arakashic/chromatica.nvim'

call vundle#end()
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
let g:airline_theme='onehalfdark'

" Keyboard switcher.
let g:XkbSwitchEnabled=1
let g:XkbSwitchLib='/usr/lib/libxkbswitch.so'
let g:XkbSwitchIMappings=['ru']

" Markdown
let g:vim_markdown_math=1
let g:vim_markdown_strikethrough=1
let g:vim_markdown_auto_insert_bullets=0

" Autocompletion
let g:ycm_use_clangd=0

" Hightlight
let g:chromatica#enable_at_startup=1
let g:chromatica#global_args=['-Iinclude/']


" ===============================================
" Plugins key bindings
" ===============================================

" UltiSnips
let g:UltiSnipsExpandTrigger="<leader>s"

" YouCompleteMe
nnoremap <silent> eu :YcmDiags<CR>

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

" Autosave
set autowrite

" Always show sign column
set signcolumn=yes

" Use mouse
set mouse=a

set conceallevel=2
set concealcursor=vin

" Open new windows at bottom
set splitbelow

" Limit popup menu height
set pumheight=20

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

" Use Shift-H and Shift-L for move to beginning/end
nnoremap H ^
nnoremap L $

" Don't overwrite clipboard on deleting.
nnoremap dd "_dd
nnoremap D "_D
nnoremap X "_X
nnoremap x "_x
xnoremap d "_d
xnoremap p "_dP

" Cut in Visual mode.
xnoremap <leader>d d

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

" Go to definition and declaration.
nnoremap <silent> gd :YcmCompleter GoToDefinition<CR>
nnoremap <silent> gD :YcmCompleter GoToDeclaration<CR>

" Quick navigation in Location list.
nnoremap <silent> en :lnext<CR>
nnoremap <silent> ep :lprevious<CR>
nnoremap <silent> eo :lopen<CR>
nnoremap <silent> ec :lclose<CR>

