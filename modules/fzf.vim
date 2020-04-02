""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF configuration options.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable FZF's Ag command; it consumes a huge amount of CPU compared to
" ripgrep, so I want to ensure I don't use it.
command! -bang -nargs=* Ag echo ":Ag is disabled; use :Rg or :RgIn."

function! FzfRgInDir(bangArg, directory, ...)
  " Join all optional arguments into a single space-separated string.
  let pattern = join(a:000)

  call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(pattern), 1, {'dir': a:directory}, a:bangArg)
endfunction

" Use FZF's ripgrep integration to search in a specific directory, provided as
" the first argument.
command! -bang -complete=dir -nargs=+ RgIn
  \ call FzfRgInDir(<bang>0, <f-args>)

" Bind <Leader>* to search with FZF for the word under the cursor.
nnoremap <silent><Leader>* :Rg <C-R><C-W><CR>

" Bind <Leader>8 to search with FZF for the word under the cursor within the
" current buffer.
nnoremap <silent><Leader>8 :BLines <C-R><C-W><CR>

" Bindings for common FZF searches.
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>t :Files<CR>

" Tell fzf to ignore files in .gitignore.
let $FZF_DEFAULT_COMMAND = 'rg --files'

" Display a border around FZF's output, which makes floating windows look nicer.
let $FZF_DEFAULT_OPTS .= '--border'

" Display FZF in a floating window.
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, 'number', 'no')

  let height = float2nr(&lines/2)
  let width = float2nr(&columns - (&columns * 2 / 10))
  "let width = &columns
  let row = float2nr(&lines / 3)
  let col = float2nr((&columns - width) / 3)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height':height,
        \ }
  let win =  nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&number', 0)
  call setwinvar(win, '&relativenumber', 0)
  call setwinvar(win, '&winhl', 'Normal:Floating')
  set winblend=10
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }
