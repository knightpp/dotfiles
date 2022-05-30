local M = {}

local map = require("utils").map

function M.setup()
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
	map("n", "]f", ":cnext<cr>", { silent = true })
	map("n", "[f", ":cprevious<cr>", { silent = true })
	map("n", "]F", ":cfirst<cr>", { silent = true })
	map("n", "[F", ":clast<cr>", { silent = true })
	map("n", "fc", ":cclose<cr>", { silent = true })

end

return M
