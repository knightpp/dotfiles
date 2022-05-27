local M = {}

local servers = {
	gopls = {},
	sumneko_lua = {},
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

--local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()) -- for nvim-cmp

local opts = {
	on_attach = on_attach,
--	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}

function M.setup()
	require("config.lsp.installer").setup(servers, opts)
end

return M
