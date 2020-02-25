:syntax on
:set number
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set mouse=a
set noswapfile
" Jump to previously open line in this file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
