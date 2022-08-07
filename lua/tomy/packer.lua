-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer management
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  use {
    'ms-jpq/coq_nvim',
    branch = 'coq'
  } -- completion

  use {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts'
  } -- snippets

  use 'folke/tokyonight.nvim' -- theme
  use {
    'norcalli/nvim-colorizer.lua',
     config = function() require('colorizer').setup {} end
  } -- color highlighting
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('lualine').setup{} end
  } -- status bar

  -- tpope magic
  use 'tpope/vim-vinegar' -- netrw powerup
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
  use "p00f/nvim-ts-rainbow" -- bracket rainbows

end)

