local M = {}
local vim = vim
local servers = {
	gopls = {},
	sumneko_lua = {},
	pyright = {},
}

--local lsp_signature = require "lsp_signature"
--lsp_signature.setup {
--	bind = true,
--	handler_opts = {
--		border = "rounded",
--	},
--}

local function on_attach(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
	-- Configure key mappings
	require("config.lsp.keymaps").setup(client, bufnr)
end

local opts = {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
}

function M.setup()
	require("config.lsp.installer").setup(servers, opts)
end

return M
