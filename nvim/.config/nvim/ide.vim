if exists('g:ide')
    echom 'Use IDE for "' . g:ide . '"'
else
    finish
endif

call plug#begin('~/.vim/plugged')

if g:ide ==? 'cpp'
    Plug 'derekwyatt/vim-fswitch'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ludovicchabant/vim-gutentags'
endif

call plug#end()

if g:ide ==? 'cpp'
    nnoremap <leader>pd g<C-]>
    nnoremap <leader>D <C-T>
    nnoremap <leader>t :ts<Space>
    nnoremap <leader>pt :ptag<Space>

    function! s:ClangFormat(first, last)
        let l:winview = winsaveview()
        execute a:first . ',' . a:last . '!clang-format'
        call winrestview(l:winview)
    endfunction
    command! -range=% ClangFormat call <sid>ClangFormat (<line1>, <line2>)

    au FileType cpp nnoremap <C-A-L> :<C-u>ClangFormat<CR>
    au FileType cpp vnoremap <C-A-L> :ClangFormat<CR>

    augroup fswitch_files
        au!
        au BufEnter *.hpp let b:fswitchdst = 'cpp'
        au BufEnter *.h let b:fswitchdst = 'cpp,c'
        au BufEnter *.cpp let b:fswitchdst = 'hpp,h'
    augroup END
    nnoremap <F10> :FSHere<CR>
endif
