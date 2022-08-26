local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- Automatically install packer
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
  require('packer').packadd = 'packer.nvim'
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
local group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerSync",
  pattern = "plugins.lua",
  group = group,
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use) use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use "terryma/vim-multiple-cursors" -- Multicursor <C-n>
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", event = "BufWinEnter", config = "require('treesitter-config')" }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    event = "BufWinEnter",
    config = "require('lualine-config')"
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    event = "BufWinEnter",
    config = "require('bufferline-config')"
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = "NvimTreeToggle",
    config = "require('nvim-tree-config')"
  }
  use { 'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter" }
  use { 'p00f/nvim-ts-rainbow', after = "nvim-treesitter" }
  use { 'windwp/nvim-autopairs', config = "require('autopairs-config')", after = "nvim-cmp" }
  use { 'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')" }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    cmd = "Telescope",
    config = "require('telescope-config')"
  }

  -- LSP
  use { 'neovim/nvim-lspconfig', config = "require('lsp')" }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use {'kkharji/lspsaga.nvim', config = "require('lspsaga-config')"}
  use 'williamboman/nvim-lsp-installer'

  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'onsails/lspkind.nvim'
  use { 'norcalli/nvim-colorizer.lua', config = "require('colorizer-config')", event = "BufRead" }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('gitsigns')",
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = "require('indent-blankline-config')",
    event = "BufRead"
  }
  use { "akinsho/toggleterm.nvim", config = "require('toggleterm-config')" }
  use { "terrortylor/nvim-comment", config = "require('comment-config')" }
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
