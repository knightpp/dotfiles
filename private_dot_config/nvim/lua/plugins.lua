local M = {}

function M.setup()
	local packer_bootstrap = false

	-- packer.nvim configuration
	local packer_conf = {
		display = {
			open_fn = function()
				return require("packer.util").float { border = "rounded" }
			end,
		},
	}

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

		-- Better icons
		use {
			"kyazdani42/nvim-web-devicons",
			module = "nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup { default = true }
			end,
		}

		use { 'ibhagwan/fzf-lua',
			requires = { 'kyazdani42/nvim-web-devicons' }
		}

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
			wants = { "nvim-lsp-installer" },
			requires = { "williamboman/nvim-lsp-installer" },
			config = function()
				require("config.lsp").setup()
			end,
		}

		use {
			'prettier/vim-prettier',
			run = 'yarn install --frozen-lockfile --production',
		}

		-- WhichKey
		use {
			"folke/which-key.nvim",
			config = function()
				require("config.whichkey").setup()
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

		use {
			'goolord/alpha-nvim',
			requires = { 'kyazdani42/nvim-web-devicons' },
			config = function()
				require 'alpha'.setup(require 'alpha.themes.startify'.config)
			end
		}

		use { 'tpope/vim-surround', event = "InsertEnter" }

		-- https://github.com/justinmk/vim-sneak
		use 'justinmk/vim-sneak'

		use { 'terrortylor/nvim-comment',
			config = function()
				require('nvim_comment').setup()
			end
		}

		use 'itchyny/lightline.vim'

		use 'machakann/vim-highlightedyank'

		-- Theme
		use 'sainnhe/gruvbox-material'

		use { 'andymass/vim-matchup', event = 'VimEnter' }

		use {
			'lewis6991/gitsigns.nvim',
			config = function()
				require("config.gitsigns").setup()
			end
		}

		-- Bootstrap Neovim
		if packer_bootstrap then
			print "Restart Neovim required after installation!"
			require("packer").sync()
		end
	end

	packer_init()
	local packer = require "packer"
	packer.init(packer_conf)
	packer.startup(plugins)
end

return M
