set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins and extensions.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Neovim language provider options.
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" coc.vim extensions.
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-diagnostic',
      \ 'coc-docker',
      \ 'coc-fish',
      \ 'coc-git',
      \ 'coc-go',
      \ 'coc-json',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-lists',
      \ 'coc-marketplace',
      \ 'coc-python',
      \ 'coc-sh',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-xml'
      \]

call plug#begin(stdpath('data') . '/plugged')
Plug 'antoinemadec/coc-fzf'
Plug 'brooth/far.vim'
Plug 'dahu/vim-fanfingtastic'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'glts/vim-textobj-comment'
Plug 'gutenye/json5.vim'
Plug 'int3/vim-extradite'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'liuchengxu/vim-better-default'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'myusuf3/numbers.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sethfowler/vim-malign'
Plug 'sjl/gundo.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/BufOnly.vim'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load modules for further configuration.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Dot(path)
  return "~/.config/nvim/" . a:path
endfunction

for file in split(glob(Dot("modules/*.vim")), "\n")
  execute "source" file
endfor
