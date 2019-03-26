" 作者: @yizhe

" Basic Behavior
set nocompatible
filetype off
syntax on

set number              " show line numbers
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set visualbell          " blink cursor on error, instead of beepinge
set clipboard=unnamed   " clipboard
set cursorline          " Endable highlighting of the curernt line

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Set vim tab name as current file name
let &titlestring = @%
set title

" Move vim swap file outside of curernt work dir
set swapfile
set dir=/tmp

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline

" Split 
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Clipboard shortcut
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

"""""""""""""""""""""""""""""""""""""
" Plugin Section
"""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" General Plugins
Plugin 'scrooloose/nerdtree'        " :NERDTree
Plugin 'godlygeek/tabular'         
Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'                   " Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
Plugin 'gregsexton/gitv'            " Vim for git
Plugin 'airblade/vim-gitgutter'     " Vim git gutter
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/SimpylFold'       " Code folding

" Scala
Plugin 'derekwyatt/vim-scala'       " Syntax
Plugin 'ryanoasis/vim-devicons'

" Python

" OSX stupid backspace fix
set backspace=indent,eol,start

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""
" Plugin Configuration
"""""""""""""""""""""""""""""""""""""

" Simple Fold
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

let base16colorspace=256  " Access colors present in 256 colorspace

" ctrl+n open file view
map <C-n> :NERDTreeToggle<CR>

" fuzzy search ctrl+f
nnoremap <C-f> :FZF<cr>

" new tab ctrl+t
nnoremap <C-t> :tabe<cr>

""""""""""""""""""""""""""""""""""""
" Language Configuration
""""""""""""""""""""""""""""""""""""

