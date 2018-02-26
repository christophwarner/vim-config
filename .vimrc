" christopher warner 
" .vimrc <cwarner@kernelcode.com>
syntax on
set nocompatible
set background=light
colorscheme solarized
let g:airline_theme='sol'
set guifont=Hack\ Regular:h14
set number
set ts=2
set sw=2
set expandtab
set sts=4
set shell=/usr/local/bin/fish
set cursorline
set lines=43 columns=132

filetype off
filetype indent on
filetype plugin on

" vim-gitgutter plugin
let g:gitgutter_highlight_lines = 1

hi CursorLine cterm=NONE ctermbg=yellow ctermfg=black guibg=#cb4b16 guifg=white

" NERDTree on startup
autocmd vimenter * NERDTree
" NERDTree on start if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Start in first window
autocmd VimEnter * wincmd l
" Last window is NERDTree.. close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 
" 

" Control-N Toggle
map <C-n> :NERDTreeToggle<CR>

" Buffer via Tab and Shift-Tab
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

execute pathogen#infect()
call pathogen#helptags()
