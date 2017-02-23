set nocompatible
filetype off

" --- Key remapping ---
nnoremap ; :

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.dotfiles/.vimrc

" --- Vundle ---

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/snippets
call vundle#begin()

" Essential
Plugin 'gmarik/Vundle.vim'

" Dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" Code view
Plugin 'ehamberg/vim-cute-python'
Plugin 'junegunn/goyo.vim'

" Color schemes
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/ScrollColors'

" Git helper
Plugin 'airblade/vim-gitgutter'

" Tab completion
Plugin 'ervandew/supertab'

" Productivity
Plugin 'garbas/vim-snipmate'

call vundle#end()

" --- Settings ---

syntax on
syntax enable

set ruler
set bs=indent,eol,start
set shell=bash
set nocompatible
set ts=4 sw=4 et
set number
set list
set hlsearch
set autoindent

au BufNewFile,BufFilePre,BufRead *.md set spell

color neverland
color nature

" --- Useful functionality ---

" Open file to last line where it was edited
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Show trailing whitespace and other weird whitespace
exec "set listchars=trail:\uB7,nbsp:~"

nnoremap <F12> :w<cr>:exec '!clear;python' shellescape(@%, 1)<cr>
map ;e :w<CR>:exe ":!python3 " . getreg("%") . "" <CR>

set ls=2
