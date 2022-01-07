" navigation across windows
nnoremap <Leader>l <C-W>l
nnoremap <Leader>k <C-W>k
nnoremap <Leader>j <C-W>j
nnoremap <Leader>h <C-W>h

" Ctrl-S is save (prolly not the most vim-esque, but old habits die hard)
map <C-s> :w <CR>
imap <C-s> <Esc> :w <CR> i

" make indenting easier by not having to reselect every time
vnoremap < <gv
vnoremap > >gv

" To remove stop using the arrow keys, I remapped the arrow keys to dummy keys in normal mode...
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

" Floaterm Options
nnoremap  <Leader>t  :FloatermToggle<CR>
inoremap  <Leader>t  <Esc>:FloatermToggle<CR>
tnoremap  <Esc>  <C-\><C-n>:FloatermToggle<CR>

" Easier tab movement
nnoremap <TAB>  :tabn<CR>
nnoremap <S-TAB> :tabp<CR>
