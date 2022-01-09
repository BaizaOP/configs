-- noremap = no recurse map, typically never tanted
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shorted function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "                                      -- typically will not use this one

-- NORMAL MODE keymaps --
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<CR>", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)                  -- Resize with arrows
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<S-k>", ":bnext<CR>", opts)                       -- Navigate buffers
keymap("n", "<S-l>", ":bprevious<CR>", opts)

vim.cmd [[ nnoremap <A-j> :m .+1<CR>== ]]
vim.cmd [[ nnoremap <A-k> :m .-2<CR>== ]]

-- INSERT MODE keymaps --
keymap("i", "jk", "<ESC>", opts)
vim.cmd [[ inoremap <A-j> <Esc>:m .+1<CR>==gi ]]
vim.cmd [[ inoremap <A-k> <Esc>:m .-2<CR>==gi ]]

-- VISUAL MODE keymaps --
keymap("v", "<", "<gv", opts)                                  -- stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)                                 -- pasting will not save the pasted text, but the initial text
vim.cmd [[ vnoremap <A-j> :m '>+1<CR>gv=gv ]]
vim.cmd [[ vnoremap <A-k> :m '<-2<CR>gv=gv ]]

-- TERMINAL better keymaps --
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
