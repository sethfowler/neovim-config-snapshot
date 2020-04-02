""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General configuration options.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Force vim-better-default to load immediately so that we can override it.
let g:vim_better_default_enable_folding = 0
let g:vim_better_default_key_mapping = 0
let g:vim_better_default_persistent_undo = 1
runtime! plugin/default.vim

" Minimum number of lines and columns to keep around the cursor.
set scrolloff=5
set sidescrolloff=5

" Show ex command changes incrementally as you type. (Neovim only; only
" supported for "s/" as of this writing.)
set inccommand=nosplit

" Two character tabs.
set shiftwidth=2
set softtabstop=2

" Enable a nice popup for ex-mode completion.
set wildmenu
set wildmode=longest:full,full

" Set formatoptions to autoformat comments, but not text/code, to 80 columns.
autocmd BufReadPost * set formatoptions=crqnj
set textwidth=80

" Configure IDE-style omnicompletion.
"set ofu=syntaxcomplete#Complete
"set completeopt=longest,menuone

" Automatically open the quickfix window when relevant.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Open the quickfix window at the bottom, regardless of splits.
autocmd FileType qf wincmd J

" Default code folding to off.
autocmd Syntax * normal zR

" Use rg as the grep program.
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" Find should search upwards until it finds a VCS directory or $HOME.
set path+=.git/../**;$HOME
set path+=.hg/../**;$HOME
set path+=.svn/../**;$HOME

" Make netrw curl follow redirects.
let g:netrw_http_xcmd = "-L -o"

" Nicer invalidation when the window is resized.
au VimResized * wincmd =

" Check if a buffer has changed on disk when it gets refocused. This should
" eventually be handled automatically by Neovim:
"   https://github.com/neovim/neovim/issues/2127
augroup checktime
    autocmd!
    autocmd BufEnter,FocusGained,BufEnter,FocusLost,WinLeave * checktime
augroup END
