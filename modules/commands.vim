""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add DiffOrig command to compare a buffer with the version on disk.
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" CDC = Change to Directory of Current file.
" LCDC does the same for the per-window current directory.
command! CDC cd %:p:h
command! LCDC lcd %:p:h

" Close all tabs quickly.
command! CloseAll tabnew|tabonly|BufOnly
