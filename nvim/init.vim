" Pretty much universal settings "{{{
""""""""""""""""""""""""""""""""""""""""""""""""""
set number " line numbers
set relativenumber " relative time numbers
set backspace=indent,eol,start " fixes WONKY backspace settings
set noerrorbells visualbell t_vb=
set mouse+=a " mouse support
set shortmess+=I " gets rid of the annoying start text
set hidden " no clue what this does lmao
set wildmenu " enable tab complete for searching, etc
let @/="" " get rid of the stupid higlighting after searching
set autowrite " auto save when use make command and other commands
set splitright " new vertical splits open right to the current window
set splitbelow " new (horizontal) splits open below to the current window
set termguicolors " allows for fancy smancy terminal colors
if has('win32')
    set makeprg=mingw32-make
endif
nmap Q <Nop>
"'Q' in normal mode enters Ex mode. YOu almost never want this
nnoremap <SPACE> <nop>
map <SPACE>  <Leader>
" for other remappings, see .\maps.vim
"}}}

" Imports "{{{
runtime ./maps.vim
runtime ./plug.vim
"}}}

" Indentation Settings "{{{
""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4 tabstop=4
set smarttab
set autoindent
filetype plugin indent on

" No autoindents for comments after 80 characters
set textwidth=0
set wrap
"}}}

" WSL Clipboard Support "{{{
""""""""""""""""""""""""""""""""""""""""""""""""""
if has('wsl')
    set clipboard+=unnamedplus
    let g:clipboard = {
        \   'name': 'win32yank-wsl',
        \   'copy': {
        \       '+': 'win32yank.exe -i --crlf',
        \       '*': 'win32yank.exe -i --crlf',
        \   },
        \   'paste': {
        \       '+': 'win32yank.exe -o --lf',
        \       '*': 'win32yank.exe -o --lf',
        \   },
        \   'cashe_enabled': 0,
        \ }
endif
" woah it totally works!!
" see https://superuser.com/questions/1291425/windows-subsystem-linux-make-vim-use-the-clipboard for more info
"}}}

" vim: set foldmethod=marker foldlevel=0:
