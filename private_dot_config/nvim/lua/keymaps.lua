local M = {}

local map = require("utils").map
local vim = vim

function M.setup()
	if not vim.g.vscode then
		vim.cmd([[
		    " Better Navigation
			nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
			xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
			nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
			xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
			nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
			xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
			nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
			xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

			" Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
			xnoremap <silent> <C-/> :call Comment()<CR>
			nnoremap <silent> <C-/> :call Comment()<CR>
			
			nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>
			
			nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
			xnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
	    ]])
	end
	-- use space as a the leader key
	--vim.g.mapleader = ' '
	vim.g['timeoutlen'] = 300

	--	local expr_opts = { noremap = true, expr = true, silent = true }
	local default_opts = { noremap = true, silent = true }

	map("v", "<", "<gv", default_opts)
	map("v", ">", ">gv", default_opts)

	-- Cancel saerch highlighting with ESC
	map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)
	-- Move selected line / block of text in visual mode
	map("x", "K", ":move '<-2<CR>gv-gv", default_opts)
	map("x", "J", ":move '>+1<CR>gv-gv", default_opts)

	-- Switch buffer
	map("n", "<S-h>", ":bprevious<CR>", default_opts)
	map("n", "<S-l>", ":bnext<CR>", default_opts)
	map("n", "]f", ":cnext<cr>", default_opts)
	map("n", "[f", ":cprevious<cr>", default_opts)
	map("n", "]F", ":cfirst<cr>", default_opts)
	map("n", "[F", ":clast<cr>", default_opts)
	map("n", "fc", ":cclose<cr>", default_opts)
end

return M
