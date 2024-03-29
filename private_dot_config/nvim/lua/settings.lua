local M = {}
local vim = vim

function M.setup()
	vim.cmd([[
		set shell=/bin/bash
		colorscheme gruvbox-material
		syntax on
		" Set systems's clipboard
		set clipboard=unnamedplus
		set completeopt=menuone,noinsert,noselect
		" set shortmess+=c
		" set textwidth=100 " Line wrap (number of cols)
		set showmatch	  " Highlight matching brace
		" set signcolumn=number
		set number relativenumber
		" "set cmdheight=2
		" set hidden
		" set ruler	" Show row and column ruler information
		set undolevels=1000	" Number of undo levels
		" set backspace=indent,eol,start	" Backspace behaviour
		set smartindent	" Enable smart-indent
		set smarttab	" Enable smart-tabs
		set autoindent	" Auto-indent new lines
		set hlsearch	" Highlight all search results
		set smartcase	" Enable smart-case search
		set incsearch	" Searches for strings incrementally
		" set linebreak	" Break lines at word (requires Wrap lines)
		set showbreak=+++ " Wrap-broken line prefix
		set shiftwidth=4	" Number of auto-indent spaces
		set softtabstop=4	" Number of spaces per Tab
		set tabstop=4 " tab size = 4 spaces
		" Hide unused statusline (replaced by lightline)
		" set noshowmode
	]])
end

return M
