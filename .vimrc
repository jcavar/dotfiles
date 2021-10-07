:syntax on

" Show document name in window title bar
:set title

" vim -p opens by default max of 10 tabs
:set tabpagemax=100

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
:set wildignore+=*/node_modules/**,*/tmp/**,*.o,*.img,kernel

" Use zsh style autocompletion
:set wildmenu
:set wildmode=full

" Display sign column always to avoid editor jumping when sign is added or removed.
:set signcolumn=yes

" Use more reasonable ESC timeout value.
:set ttimeoutlen=100

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
    au BufNewFile,BufRead *Fastfile* setf ruby

endif

" Automatic indenation per filetype
filetype plugin indent on
let g:asyncomplete_auto_completeopt = 0
set completeopt=menu,menuone,noinsert,preview

if executable('/usr/local/opt/llvm/bin/clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['/usr/local/opt/llvm/bin/clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('solargraph')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby', 'erb'],
        \ })
endif

if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp', '--log-level', 'debug']},
        \ 'whitelist': ['swift'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
let g:lsp_diagnostics_echo_cursor = 1
set backspace=indent,eol,start

inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
endif

" Enable more advanced % jumps
runtime macros/matchit.vim

function! FormatJSON()
:%!python -m json.tool
endfunction

let g:netrw_liststyle = 3
let g:netrw_winsize = 25
