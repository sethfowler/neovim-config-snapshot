""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive configuration options.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically delete Fugitive buffers when hidden.
autocmd BufReadPost fugitive://* set bufhidden=delete

" Open Fugitive :Gstatus with <Leader>g.
nnoremap <Leader>g :10Gstatus<CR>
