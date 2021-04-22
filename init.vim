" christopher warner
" init.vim <cwarner@kernelcode.com>
" for neovim
"
syntax on
set termguicolors
set guifont=Hack\ Regular:h14
set number
set ts=2
set sw=2
set expandtab
set sts=4
set shell=/usr/local/bin/fish
set cursorline
set lines=43 columns=132

colorscheme NeoSolarized

let g:lightline = {
      \ 'colorscheme': 'PaperColor_light',
      \ }

let g:fugitive_git_executable = '/usr/bin/git'
filetype on
filetype indent on
filetype plugin on

hi CursorLine cterm=NONE ctermbg=yellow ctermfg=black guibg=#cb4b16 guifg=white

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Lightline
Plug 'itchyny/lightline.vim'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Fugitive
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

" NERDTree on startup
autocmd vimenter * NERDTree
" NERDTree on start if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Start in first window
autocmd VimEnter * wincmd l
" Last window is NERDTree.. close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
"
"" Control-N Toggle
map <C-n> :NERDTreeToggle<CR>

" Buffer via Tab and Shift-Tab
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>


