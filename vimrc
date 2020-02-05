"        .__                       
"  ___  _|__| ____________   ____  
"  \  \/ /  |/     \_  __ \_/ ___\ 
"   \   /|  |  Y Y  \  | \/\  \___ 
" /\ \_/ |__|__|_|  /__|    \___  >
" \/              \/            \/
"
" Author: chs

" Plugins ---------------------------------------------------------------- {{{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'PontusPersson/pddl.vim'
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi-vim'
call plug#end()

" }}}
" Basic Setup ------------------------------------------------------------ {{{

set nocompatible
filetype plugin indent on
syntax on
set background=dark
set viminfo+=n~/.vim/viminfo

""" buffer config
" doesn't force save before changing buffer
set hidden

" }}}
" Finding Files ---------------------------------------------------------- {{{

" seach down into subfolders, provides tab completion
set path+=**
set wildmenu

" }}}
" Python ----------------------------------------------------------------- {{{
augroup python
	autocmd!
	autocmd BufNewFile,BufRead *.py	set tabstop=4
	autocmd BufNewFile,BufRead *.py set softtabstop=4
	autocmd BufNewFile,BufRead *.py set shiftwidth=4
	autocmd BufNewFile,BufRead *.py set textwidth=79
	autocmd BufNewFile,BufRead *.py set expandtab
	autocmd BufNewFile,BufRead *.py set autoindent
	autocmd BufNewFile,BufRead *.py set fileformat=unix
augroup end
" }}}
" PDDL ------------------------------------------------------------------- {{{
augroup pddl
	autocmd!
	autocmd BufNewFile,BufRead *.pddl set tabstop=4
	autocmd BufNewFile,BufRead *.pddl set softtabstop=4
	autocmd BufNewFile,BufRead *.pddl set shiftwidth=4
	autocmd BufNewFile,BufRead *.pddl set textwidth=79
	autocmd BufNewFile,BufRead *.pddl set expandtab
	autocmd BufNewFile,BufRead *.pddl set autoindent
	autocmd BufNewFile,BufRead *.pddl set fileformat=unix
    	autocmd BufNewFile,BufRead *.pddl iabbrev action (:action<CR><TAB>:parameters<CR><TAB>()<CR><backspace>:precondition<CR><tab>()<CR><backspace>:effect<CR><tab>()<CR><backspace><backspace>)
augroup end

" }}}
" Keybindings ------------------------------------------------------------ {{{
set number relativenumber wrap shiftround numberwidth=4
let mapleader=","
let localmapleader="\\"

" grab line and move it down
nnoremap <leader>- ddp

" grab line and move it up
nnoremap <leader>_ kddpk

" open and close folds
nnoremap <space> za

" capitalise current word in insert mode
inoremap <leader><c-u> <esc>viwUea

" capitalise current word in normal mode
nnoremap <leader><c-u> viwUe

"open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"buffer next
map <right> :bNext<CR>

"buffer previous
map <left> :bprevious<CR>

"buffer delete
nnoremap <leader>bd :bdelete<CR>

" change window pane left right up and down
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
iabbrev hw@ chs1@hw.ac.uk
iabbrev hotmail@ callum.stewart.97@hotmail.com
iabbrev protonmail@ c.h.stewart@protonmail.com
iabbrev gmail@ ericpickles229@gmail.com
" }}}

" vim: filetype=vim foldmethod=marker foldlevel=0
