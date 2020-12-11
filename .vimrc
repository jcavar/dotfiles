:syntax on

" vim -p opens by default max of 10 tabs
:set tabpagemax=100
:set spell

" Enable mouse
:set mouse=a

" Show line and column number
:set ruler

" Autowrite files when switching to avoid annoying splits
:set autowrite
:set number
:set expandtab
:set tabstop=4
:set shiftwidth=4

" Search
"
" Highlight searches and reset temporarily with CTRL-L
:set hlsearch
nnoremap <C-l> :<C-u>nohlsearch<CR><C-l>

" When searching in lowercase, we want to show results in uppercase as well
:set ignorecase
:set smartcase

" Show number of search matches
:set shortmess-=S
" Show preview while searching
set incsearch

:set history=1000
set noswapfile
" Tell vimgrep to ignore some directories 
:set wildignore+=*/node_modules/**,*/tmp/**

" Use zsh style autocompletion
:set wildmenu
:set wildmode=full


" Colors
:packadd! onedark.vim
:set termguicolors
:colorscheme onedark

if has("autocmd")
    " Jump to previously open line in this file
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
    " Set filetype of Jenkinsfile to groovy
    au BufNewFile,BufRead *Jenkinsfile* setf groovy

endif

" Automatic indenation per filetype
filetype plugin indent on
set backspace=indent,eol,start

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
endif

" Enable more advanced % jumps
runtime macros/matchit.vim

function! FormatJSON()
:%!python -m json.tool
endfunction

