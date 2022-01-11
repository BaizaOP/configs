local fn = vim.fn

-- Automatically install packerj
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim wheneverr you sae the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded"}
    end,
  },
}
return packer.startup(function(use)
  -- Plugins here!
  use "wbthomason/packer.nvim"                      -- have packer manage itself
  use "nvim-lua/popup.nvim"                         -- an implementation of the popup api from vim in neovim
  use "nvim-lua/plenary.nvim"                       -- useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs"

  -- much colors
  --use "cocopon/iceberg.vim"
  --use "NLKNguyen/papercolor-theme"
  use "easysid/mod8.vim"
  --use "agude/vim-eldar"

  -- cmp plugins
  use "hrsh7th/nvim-cmp"                            -- the completion plugin
  use "hrsh7th/cmp-buffer"                          -- buffer completions
  use "hrsh7th/cmp-path"                            -- path completions
  use "hrsh7th/cmp-cmdline"                         -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"                    -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip"                            -- snippet engine
  use "rafamadriz/friendly-snippets"                -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"                       -- enable LSP
  use "williamboman/nvim-lsp-installer"             -- simple to use language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Comment plugins
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
