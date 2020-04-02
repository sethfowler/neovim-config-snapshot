""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype-specific options.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use '--' delimiters by default for Haskell comments.
let g:NERDCustomDelimiters = {
    \ 'haskell': { 'leftAlt': '{-','rightAlt': '-}', 'left': '-- ', 'right': '' },
\ }

" Go-specific options.
let g:go_bin_path = $HOME."/go/bin"

" Treat specific JSON files as JSON5.
autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=json5
