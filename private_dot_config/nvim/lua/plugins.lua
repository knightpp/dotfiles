local M = {}
local vim = vim

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
		local function use_plugin(args)
			local vscode = false
			if type(args) == "table" then
				vscode = args.vscode or false
			end

			if vim.g.vscode then
				if vscode then
					use(args)
				end
			else
				use(args)
			end
		end

		use_plugin {
			'wbthomason/packer.nvim',
			vscode = true,
		}

		-- Better icons
		use_plugin {
			"kyazdani42/nvim-web-devicons",
			module = "nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup { default = true }
			end,
		}

		use_plugin {
			'ibhagwan/fzf-lua',
			requires = { 'kyazdani42/nvim-web-devicons' },
			vscode = true,
		}

		-- Automatically closes brackets
		use_plugin {
			'rstacruz/vim-closer',
			vscode = true,
		}

		-- lsp configs
		use_plugin 'williamboman/nvim-lsp-installer'

		use_plugin {
			'neovim/nvim-lspconfig',
			opt = true,
			event = "BufReadPre",
			wants = { "nvim-lsp-installer" },
			requires = { "williamboman/nvim-lsp-installer" },
			config = function()
				require("config.lsp").setup()
			end,
		}

		use_plugin {
			'prettier/vim-prettier',
			run = 'yarn install --frozen-lockfile --production',
		}

		-- WhichKey
		use_plugin {
			"folke/which-key.nvim",
			config = function()
				require("config.whichkey").setup()
			end,
			vscode = true,
		}

		-- Treesitter
		use_plugin {
			'nvim-treesitter/nvim-treesitter',
			opt = true,
			event = "BufRead",
			run = ':TSUpdate',
			config = function()
				require("config.treesitter").setup()
			end,
		}

		use_plugin {
			'goolord/alpha-nvim',
			requires = { 'kyazdani42/nvim-web-devicons' },
			config = function()
				require 'alpha'.setup(require 'alpha.themes.startify'.config)
			end
		}

		use_plugin {
			'tpope/vim-surround',
			event = "InsertEnter",
			vscode = true,
		}

		use_plugin {
			'justinmk/vim-sneak',
			vscode = true,
		}

		use_plugin {
			'terrortylor/nvim-comment',
			config = function()
				require('nvim_comment').setup()
			end,
			vscode = true,
		}

		use_plugin 'itchyny/lightline.vim'

		use_plugin {
			'machakann/vim-highlightedyank',
			vscode = true,
		}

		-- Theme
		use_plugin 'sainnhe/gruvbox-material'

		use_plugin {
			'andymass/vim-matchup',
			event = 'VimEnter',
			vscode = true,
		}

		use_plugin {
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
