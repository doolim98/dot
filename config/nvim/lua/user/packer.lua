local fn = vim.fn

-- Automatically install packer
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim" 
	use "nvim-lua/plenary.nvim" 
	use "windwp/nvim-autopairs"
	use "ryvnf/readline.vim"
	use "junegunn/fzf"
	use "junegunn/fzf.vim"
	
	use 'tpope/vim-commentary'
	-- use 'farmergreg/vim-lastplace'
	use 'mileszs/ack.vim'
	use 'preservim/nerdtree'
	use 'christoomey/vim-tmux-navigator'
	-- use "numToStr/Comment.nvim"
	-- use "antoinemadec/FixCursorHold.nvim" 

	-- Colorschemes
	use 'ishan9299/nvim-solarized-lua'

	-- cmp plugins
	use "hrsh7th/nvim-cmp" 
	use "hrsh7th/cmp-buffer" 
	use "hrsh7th/cmp-path" 
	use "hrsh7th/cmp-cmdline" 
	use "hrsh7th/cmp-nvim-lsp"

	-- tags
	use "vim-scripts/gtags.vim"

	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	-- use "neovim/nvim-lspconfig" 
	-- use "williamboman/nvim-lsp-installer" 
	-- use "tamago324/nlsp-settings.nvim" 
	-- use "jose-elias-alvarez/null-ls.nvim" 

	-- Telescope
	use "nvim-telescope/telescope.nvim"
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "JoosepAlviste/nvim-ts-context-commentstring"

	-- Git
	-- use "lewis6991/gitsigns.nvim"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

