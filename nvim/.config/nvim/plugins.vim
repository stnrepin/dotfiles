"
" Plugins
"

call plug#begin('~/.vim/plugged')

" Color scheme
Plug 'arcticicestudio/nord-vim'

" Keyboard switcher.
Plug 'lyokha/vim-xkbswitch'

" Highlight
Plug 'bfrg/vim-cpp-modern', { 'for': ['cpp', 'c'] }

" Fzf
Plug 'junegunn/fzf.vim'

" Latex
Plug 'lervag/vimtex', { 'for': 'latex' }

" Surround
Plug 'tpope/vim-surround'

" Vim GPG
Plug 'jamessan/vim-gnupg'

call plug#end()

"
" Plugins config
"

" Color scheme
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:nord_underline=0
let g:nord_italic=1
let g:nord_italic_comments=1

" Disable underlining in spelling.
augroup nord-theme-overrides
  autocmd!
  autocmd ColorScheme nord highlight SpellBad gui=NONE
  autocmd ColorScheme nord highlight SpellCap gui=NONE
  autocmd ColorScheme nord highlight SpellLocal gui=NONE
  autocmd ColorScheme nord highlight SpellRare gui=NONE
augroup END

colorscheme nord

" Keyboard switcher
let g:XkbSwitchEnabled=1
let g:XkbSwitchLib='/usr/lib/libxkbswitch.so'
let g:XkbSwitchIMappings=['ru']

" Latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:did_inden=0

" Fzf
let g:fzf_layout = { 'down': '~40%' }

"
" Plugins key bindings
"

" Fzf
nnoremap <leader>r :Rg<Space>
nnoremap <leader>R :Rg <C-R>0
nnoremap <leader>/ :Buffers<CR>
nnoremap <leader>f :Files<CR>
