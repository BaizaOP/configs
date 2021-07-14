""""""""""\ Pretty much universal settings /""""""
set nocompatible " disables some vi things which makes vim more 'fully funcitoned'
set number " line numbers
set relativenumber " relative time numbers
set laststatus=2 " window will always have status bar
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

""""""""""\ Disable arrow keys /""""""""""""""""""
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

""""""""""\ Vim Plug /""""""""""""""""""""""""""""
call plug#begin(stdpath('data') . './plugged')

Plug 'tpope/vim-commentary'
Plug 'nanotech/jellybeans.vim'
Plug 'markvincze/panda-vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'itchyny/lightline.vim'

call plug#end()

" color panda " best color pallate EVER
" NOT ANYMORE LOL
color jellybeans

""""""""""\ Light Line Settings /"""""""""""""""""
set noshowmode "get rid of the "-- INSERT --" at the bottom as it is a part of the plugin
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ }

""""""""""\ Status Line Settings /""""""""""""""""
" set statusline=              " start the status line
" set statusline+=%#DiffChange#  " the green color
" set statusline+=\ %M         " modified since last save
" set statusline+=\ %y         " type of file in []
" set statusline+=\            " another space at the end
" " set statusline+=\ %r       " read only flag -- adds a space I do not like
" set statusline+=%#WildMenu# " the orange color
" set statusline+=\            " Space
" set statusline+=\%f          " relative path to file
" " set statusline+=\%F          " full path to file
" set statusline+=\            " Space
" set statusline+=%#DiffChange#  " the green color

" "" The Right Side
" set statusline+=%=           " right side settings
" set statusline+=%#WildMenu#   " the orange color -- use ':so $VIMRUNTIME/syntax/hitest.vim'
" set statusline+=\ %c:%l/%L   " column number:line number/length of line
" set statusline+=\            " Space

""""""""""\ Indentation Settings /""""""""""""""""
set expandtab
set shiftwidth=4 tabstop=4
set nosmarttab " is this redundant????
set smarttab
set autoindent
filetype plugin indent on

" No autoindents for comments after 80 characters
set textwidth=0
set wrap

""""""""""\ Remappings /"""""""""""""""""""""""""
nnoremap <SPACE> <nop>
map <SPACE>  <Leader>
nnoremap <Leader>l <C-W>l
nnoremap <Leader>k <C-W>k
nnoremap <Leader>j <C-W>j
nnoremap <Leader>h <C-W>h
map <C-s> :w <CR>
imap <C-s> <Esc> :w <CR> i

""""""""""\ Latex in Vim Stuffs /""""""""""""""""
" I hate this plugin lmao
" let g:tex_flavor = "latex" " Make vim automatically know this is a latex file
" let g:vimtex_quickfix_open_on_warning = 0
" let g:vimtex_quickfix_mode = 2
" if has('nvim')
"    let g:vimtex_compiler_progname = 'nvr'
" endif
" let g:tex_conceal = ""
" let g:latex_view_general_viewer = "zathura"
" let g:vimtex_view_method = "zathura"
" copied from https://gist.github.com/skulumani/7ea00478c63193a832a6d3f2e661a536
" :)

""""""""""\ Vim Latex Live Preview /"""""""""""""
"I sure hope this works :(((((
let g:livepreview_previewer = 'zathura'
" Yay it works

""""""""""\ WSL Clipboard Support /""""""""""""""
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
" woah it totally works!!
" see https://superuser.com/questions/1291425/windows-subsystem-linux-make-vim-use-the-clipboard for more info
