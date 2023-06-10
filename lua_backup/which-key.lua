local wk = require("which-key")

wk.setup {
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 36,
		},
		presets = {
			operators = false,
			motions = false,
			text_objects = false,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	key_labels = {
		["<space>"] = "SPC",
		["<cr>"] = "RET",
		["<Tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	window = {
		border = "single",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 0, 2, 0, 2 },
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
	ignore_missing = false,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local nmaps = {
	["<c-a>"] = { "ggVG", "Select All" },
	["<leader>"] = {
		e = { "<cmd>NvimTreeToggle<CR>", "File Tree" },
		f = {
			name = "Find",
			f = { "<cmd>Telescope find_files<CR>", "Files" },
			s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document symbols" },
			w = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace symbols" },
			g = { "<cmd>Telescope live_grep<CR>", "Grep" },
			b = { "<cmd>Telescope buffers<CR>", "Buffers" },
			
		},
		x = { "<cmd>bdelete<CR>", "Close Buffer" },
	}
}


wk.register(nmaps, {mode = 'n', noremap = true, silent = true})

