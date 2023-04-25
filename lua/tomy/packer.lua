-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- packer management
	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP

	-- telescope config
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")

	use({
		"ms-jpq/coq_nvim",
		branch = "coq",
	}) -- completion
	use({ "mhartington/formatter.nvim" }) -- formatting

	use({
		"ms-jpq/coq.artifacts",
		branch = "artifacts",
	}) -- snippets

	use("folke/tokyonight.nvim") -- theme
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	}) -- color highlighting
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({})
		end,
	}) -- status bar

	-- tpope magic
	use("tpope/vim-vinegar") -- netrw powerup
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- go nvim plugin
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua") -- recommanded if need floating window support
	use("p00f/nvim-ts-rainbow") -- bracket rainbows

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("mattn/emmet-vim")

	use({ "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim" } })
	use("purescript-contrib/purescript-vim")
	use({
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		commit = "fd4525fd9e61950520cea4737abc1800ad4aabb",
	})
end)
