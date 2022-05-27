local M = {}

function M.setup()
	require("nvim-treesitter.configs").setup {
		ensure_installed = {
			"lua", "go",
		},

		sync_install = false,
		-- vim-matchup
		matchup = {
			enable = true,
		},

		indent = { enable = true },

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	}
end

return M
