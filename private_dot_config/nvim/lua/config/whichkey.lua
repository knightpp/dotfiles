local M = {}

function M.setup()
	local whichkey = require "which-key"

	local conf = {
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
	}

	local opts = {
		mode = "n", -- Normal mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = false, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	}

	local mappings = {
		["w"] = { "<cmd>update!<CR>", "Save" },
		["W"] = { "<cmd>update<CR><cmd>bd<cr>", "Save and quit" },
		["q"] = { "<cmd>q<CR>", "Quit" },
		["Q"] = { "<cmd>q!<CR>", "Force quit" },

		p = { "<Cmd>:PrettierAsync<Cr>", "Format with Prettier" },
		f = { "<Cmd>FzfLua files<Cr>", "Open FZF with files" },

		t = {
			name = "File tree",
			t = { "<Cmd>NvimTreeToggle<Cr>", "Toggle file tree" },
			f = { "<Cmd>NvimTreeFocus<Cr>", "Focus file tree" },
			F = { "<Cmd>NvimTreeFindFile<Cr>", "Focus current file in tree" },
			C = { "<Cmd>NvimTreeCollapse<Cr>", "Collaps tree recursively" },
		},

		b = {
			name = "Buffer",
			b = { "<Cmd>FzfLua buffers<Cr>", "List buffers in FZF" },
			c = { "<Cmd>bd!<Cr>", "Close current buffer" },
			D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
		},

		z = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},

		g = {
			name = "Git",
			s = { "<cmd>Neogit<CR>", "Status" },
		},
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)
end

return M
