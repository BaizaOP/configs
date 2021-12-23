" Pretty much universal settings "{{{
""""""""""""""""""""""""""""""""""""""""""""""""""
set number " line numbers
set relativenumber " relative time numbers
set backspace=indent,eol,start " fixes WONKY backspace settings
nmap Q <Nop>
"'Q' in normal mode enters Ex mode. YOu almost never want this
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
set makeprg=mingw32-make
"}}}

" Vim Plug "{{{
call plug#begin(stdpath('data') . '\plugged')

Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'

Plug 'tomasr/molokai'
Plug 'shapeoflambda/dark-purple.vim'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()
"}}}

" Light Line Settings "{{{
set noshowmode
set laststatus=2 " Window will always show status bar
let g:lightline = {
      \ 'colorscheme': 'dark_purple',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'gitbranch'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
colorscheme dark_purple
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

" Remappings "{{{
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <SPACE> <nop>
map <SPACE>  <Leader>
nnoremap <Leader>l <C-W>l
nnoremap <Leader>k <C-W>k
nnoremap <Leader>j <C-W>j
nnoremap <Leader>h <C-W>h
map <C-s> :w <CR>
imap <C-s> <Esc> :w <CR> i
vnoremap < <gv
vnoremap > >gv

" Remap Arrow Keys in in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" alt-j and alt-k to move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv 

" Floatterm Options 
nnoremap  <leader>t  :FloatermToggle<CR>
inoremap  <leader>t  <Esc>:FloatermToggle<CR>
tnoremap  <Esc>  <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_shell="pwsh.exe"
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
