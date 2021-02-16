"syntax hilighting
filetype indent plugin on
syntax enable

"indent option set ai
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab

"search stuff
set hlsearch
set smartcase
set incsearch

"swapfile stuff
set noswapfile

"text rendering
set encoding=utf-8
set linebreak
set scrolloff=2

"UI options
set ruler
set noerrorbells
set nu
set rnu
set laststatus=2
set backspace=2
set nowrap
set showcmd

"statusline
set stl=%m%h%w\ \|%n\ <%f>\|%=%l:%c\ \|%p%%\ %L\|

"code folding options
set foldmethod=indent
set foldnestmax=3
set nofoldenable

"fuzzy search
set path+=**
set wildmenu
set wildignore+=**/node_modules/**

"useful stuff
let g:mapleader=" "
set clipboard=unnamed
set nocompatible
set clipboard=unnamedplus

"netrw config
let g:netrw_liststyle=3
let g:netrw_banner=0

"window maps
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

"window moving maps
nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L

"general maps
nnoremap <F6> :so %<CR>
nnoremap <Leader><C-e> :15Lexplore<CR>
inoremap jj <Esc>
nnoremap <Leader>n :nohls<CR>

"autocomplete
autocmd BufRead *.cpp,*.hpp,Makefile nnoremap <Leader>t :!ctags languages=c++ .<CR>
set completeopt=longest,menuone

call plug#begin()
call plug#end()
