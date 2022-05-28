local M = {}

local map = require("utils").map

function M.setup()
	map("n", "<leader>/", ":Commentary<cr>", { noremap = true })
	map("n", "<leader>f", ":FZF<cr>", { noremap = true })

	map("n", "]f", ":cnext<cr>", { silent = true })
	map("n", "[f", ":cprevious<cr>", { silent = true })
	map("n", "]F", ":cfirst<cr>", { silent = true })
	map("n", "[F", ":clast<cr>", { silent = true })
	map("n", "fc", ":cclose<cr>", { silent = true })
end

return M
