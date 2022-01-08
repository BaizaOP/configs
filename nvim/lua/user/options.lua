-- :help options
vim.opt.cmdheight = 2
vim.opt.completeopt = { "menuone", "noselect" } -- used for cmp
vim.opt.conceallevel = 0
-- vim.opt.cursorline = true
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 1000                       -- time to wait for keys in a mapping (ex "gcc")
vim.opt.undofile = true
vim.opt.updatetime = 300                        -- faster completion (4000ms default)

-- make alphabetical for above, maybe with alt-j + alt-k keymaps?
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- 2 tab width
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"                      -- shows that line left of the line numbers
vim.opt.wrap = false                            -- one long line of text
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"               -- font used for graphical nvim

vim.opt.shortmess:append "c"                    -- see :help shortmess

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set iskeyword+=-"

