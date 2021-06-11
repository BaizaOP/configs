""""""""""\ Beginner Settings /""""""""""""""""""" 
set nocompatible
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
nmap Q <Nop> 
"'Q' in normal mode enters Ex mode. You almost never want this
set noerrorbells visualbell t_vb=
set mouse+=a
set hidden
set wildmenu
let @/ = "" " get rid of the STUPID HIGHLIGHTING URGH 
set autowrite " automatically saves when makefile made, etcs
set makeprg=mingw32-make " By default :make searches for a make command
                         " but my mingw installation uses 'mingw32-make'
                         " so this switches it to the correct maker
set splitright
set splitbelow

""""""""""\ Searching Settings /"""""""""""""""""" 
set hlsearch
set incsearch
set ignorecase
set smartcase

""""""""""\ Syntax settings /""""""""""""""""""""" 
syntax enable 
colo jellybeans

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

""""""""""\ Indentation Settings /""""""""""""""""
set expandtab
set shiftwidth=4 tabstop=4
set nosmarttab 
set smarttab
set autoindent
filetype plugin indent on 

" No autoindents for comments after 80 characters 
set textwidth=0
set wrap

" No indent at all after a tab 
" set indentexpr=0
" set noautoindent
" set indentkeys-=0#
" set cindent

""""""""""\ Save Folds /"""""""""""""""""""""""""" 
"augroup remember_folds
"  autocmd!
"  autocmd BufWinLeave ?. mkview 1
"  autocmd BufWinEnter *.* silent! loadview 1
"augroup END
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
" Fix this, but I have to comment this as I am sick of the errors

""""""""""\ Status Line /"""""""""""""""""""""""""
"" The Left Side
set statusline=              " start the status line 
set statusline+=%#DiffChange#  " the blue color
set statusline+=\ %M         " modified since last change
set statusline+=\ %y         " type of file in []
set statusline+=\            " another space at the end  
" set statusline+=\ %r       " read only flag -- adds a space I do not like
set statusline+=%#PreProc# " the blue color
set statusline+=\            " Space
set statusline+=\%f          " relative path to file
" set statusline+=\%F          " full path to file
set statusline+=\            " Space
set statusline+=%#DiffChange#  " the blue color

"" The Right Side
set statusline+=%=           " right side settings
set statusline+=%#PreProc#   " the red color -- use ':so C:\Program Files (x86)\Vim\vim82\syntax\hitest.vim'
set statusline+=\ %c:%l/%L   " column number:line number/length of line 
set statusline+=\            " Space
" check out :help statusline for more info!

""""""""""\ Vim Plug /"""""""""""""""""""""""""""" 
call plug#begin('C:\Program Files (x86)\Vim\vim82\plugged')

Plug 'lervag/vimtex'
Plug 'vim-scripts/Wombat'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

""""""""""\ VimTeX Plugin /""""""""""""""""""""""" 
" see 'https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt' for more info
" Basically, a clientserver is needed to backward search from PDF viewer to Vim
if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif

set encoding=utf8
let maplocalleader="\\"
let g:tex_flavor="latex"
let g:vimtex_enable=1

""""""""""\ Remappings /"""""""""""""""""""""""""" 
nnoremap <SPACE> <nop>
map <SPACE>  <Leader>
nnoremap <Leader>l <C-W>l
nnoremap <Leader>k <C-W>k
nnoremap <Leader>j <C-W>j
nnoremap <Leader>h <C-W>h

