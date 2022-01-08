-- :help options
local options = {
  -- vim.opt.cursorline = true
  cmdheight = 2,
  completeopt = { "menuone", "noselect" }, -- used for cmp
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,                          -- pop up menu height
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  timeoutlen = 1000,                       -- time to wait for keys in a mapping (ex "gcc")
  undofile = true,
  updatetime = 300,                        -- faster completion (4000ms default),

  -- make alphabetical for above, maybe with alt-j + alt-k keymaps?
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- 2 tab width
  tabstop = 2,
  number = true,
  relativenumber = true,
  numberwidth = 2,
  signcolumn = "yes",                      -- shows that line left of the line numbers
  wrap = false,                            -- one long line of text
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- font used for graphical nvim
}

vim.opt.shortmess:append "c"                    -- see :help shortmess

-- ooh nice, a for loop over a dictionary! \o/
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set iskeyword+=-"

