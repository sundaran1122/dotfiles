" syntax stuff
filetype indent plugin on
syntax enable

"editing stuff
set backspace=2

"search stuff
set incsearch
set nohls

"text rendering
set encoding=utf-8
set linebreak
set nowrap

"UI rendering
set noruler
set showcmd
set lazyredraw
set confirm
set cursorline
set laststatus=0

"indent options
set shiftwidth=2
set tabstop=2
set smarttab
set noexpandtab

"swapfile and undo stuff
set swapfile
set dir=$HOME/.cache/swapfiles
set undodir=$HOME/.cache/undos/
set undofile

"code folding options
set foldmethod=indent
set foldnestmax=3

"fuzzy search
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set wildignore+=*.o

"spliting windows and tabs
set splitright
set splitbelow
set stal=1

"useful stuff
let g:mapleader=" "
set nocp
set clipboard=unnamedplus
set shell=zsh
set noerrorbells
set mouse=n "enable mouse in normal mode only

"autocomplete
set completeopt=longest,menuone
set tags=./tags

call plug#begin()
Plug 'arcticicestudio/nord-vim'
call plug#end()

"color stuff
set termguicolors
let g:nord_cursor_line_number_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
"colorscheme nord


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
nnoremap <Leader>n :nohls<CR>
nnoremap <Leader><Leader> /<++><CR>ca<
inoremap <C-space> <Esc>/<++><CR>ca<

"filetype based commands
au BufNewFile,BufRead *.md set wrap
