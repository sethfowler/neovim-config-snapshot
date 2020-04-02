""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General mappings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bind gp to selected last changed / pasted text.
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Bind jk characters (typed quickly) to exit insert mode.
inoremap jk <Esc>

" Replace 'section-based' navigation, which i rarely find useful, with
" 'jump to the next/previous brace with same or lower indentation'.
function! GoToPatternMatchWithSameOrLowerIndent(direction, pattern)
  let ln = line('.')
  let ind = indent(ln)
  let indent_valid = strlen(getline(ln))
  let ln = ln + a:direction

  while((ln >= 1) && (ln <= line('$')))
    if (!indent_valid) && strlen(getline(ln)) 
        break
    else
      if (strlen(getline(ln)) && match(getline(ln), a:pattern) == 0)
        if (indent(ln) <= ind)
          break
        endif
      endif
    endif
    let ln = ln + a:direction
  endwhile

  execute "normal ".ln."G"
endfunction

nnoremap [[ :call GoToPatternMatchWithSameOrLowerIndent(-1, '\v^\s*\{')<cr>
nnoremap ]] :call GoToPatternMatchWithSameOrLowerIndent(1, '\v^\s*\{')<cr>
nnoremap [] :call GoToPatternMatchWithSameOrLowerIndent(-1, '\v^\s*\}')<cr>
nnoremap ][ :call GoToPatternMatchWithSameOrLowerIndent(1, '\v^\s*\}')<cr>

" Make Y behave like other capitals.
noremap Y y$

" Better command-line editing using Emacs-style commands.
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Switch between normal and relative line-numbering.
nnoremap <C-_> :NumbersToggle<cr>

" Toggle hidden characters.
nnoremap <Leader>s :set list!<CR>

" Allow q; to open the commandline window with a history of commands.
nnoremap q; q:
vnoremap q; q:

" Clear search highlight.
nnoremap <silent> <C-BSlash>  :nohls<cr>

" Delete a buffer while preserving window layout.
nnoremap <silent> <Leader>db    :Sbd<CR>

" Use ZW to update the current buffer (analogous to ZZ and ZQ).
nnoremap ZW :update<CR>

" Toggle Gundo with <Leader>u.
nnoremap <Leader>u :GundoToggle<CR>

" Nicer text bubbling with unimpaired in visual mode.
vmap <Up> [egv
vmap <Down> ]egv

" Up/down move between visual lines instead of actual lines when wrapped.
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

" Switch between windows more easily.
nnoremap <s-c-j> <c-w>j
nnoremap <s-c-k> <c-w>k
nnoremap <s-c-h> <c-w>h
nnoremap <s-c-l> <c-w>l

" bind s to insert a single character and S to append one
function! RepeatChar(char, count)
 return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
