local M = {}

function M.setup()
	local packer_bootstrap = false

	-- packer.nvim configuration
	local packerConf = {}

	-- Check if packer.nvim is installed
	-- Run PackerCompile if there are changes in this file
	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system {
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
			}
			vim.cmd [[packadd packer.nvim]]
		end
		vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
	end

	local function plugins(use)
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

	--	use {
	--		"rcarriga/nvim-notify",
	--		event = "VimEnter",
	--		config = function()
	--			vim.notify = require "notify"
	--		end,
	--	}

		-- Better icons
		use {
			"kyazdani42/nvim-web-devicons",
			module = "nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup { default = true }
			end,
		}

		-- Better Comment
		--use {
		--	"numToStr/Comment.nvim",
		--	keys = { "gc", "gcc", "gbc" },
		--	config = function()
		--		require("Comment").setup {}
		--	end,
		--}

		-- Automatically closes brackets
		use 'rstacruz/vim-closer'
		-- Copilot
		use 'github/copilot.vim'
		-- lsp configs
		use 'williamboman/nvim-lsp-installer'
		use {
			'neovim/nvim-lspconfig',
			opt = true,
			event = "BufReadPre",
			wants = { "nvim-lsp-installer"},
			requires = { "williamboman/nvim-lsp-installer" },
			config = function()
				require("config.lsp").setup()
			end,
		}

		-- Treesitter
		use {
			'nvim-treesitter/nvim-treesitter',
			opt = true,
			event = "BufRead",
			run = ':TSUpdate',
			config = function()
				require("config.treesitter").setup()
			end,
		}

		use { 'tpope/vim-surround', event = "InsertEnter" }

		-- https://github.com/justinmk/vim-sneak
		use 'justinmk/vim-sneak'

		use 'itchyny/lightline.vim'

		use 'machakann/vim-highlightedyank'

		-- Theme
		use 'morhetz/gruvbox'

		use { 'andymass/vim-matchup', event = 'VimEnter' }

		use {
			'lewis6991/gitsigns.nvim',
			config = function() require('gitsigns').setup() end
		}

		-- Bootstrap Neovim
		if packer_bootstrap then
			print "Restart Neovim required after installation!"
			require("packer").sync()
		end
	end

	packer_init()
	local packer = require "packer"
	packer.init(packerConf)
	packer.startup(plugins)
end

return M
