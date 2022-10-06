local packer = require("packer")

local plugins = packer.startup({function (use)
    -- Packer
	use {
		"wbthomason/packer.nvim",
		config = [[require("config.packer")]]
	}

    -- Speed Up
	use { "lewis6991/impatient.nvim" }

    -- Status line written in lua
    use {
        'nvim-lualine/lualine.nvim',
        config = [[require("config.lualine")]]
    }
    
    -- Theme inspired by Atom
    use 'joshdick/onedark.vim'

    -- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = "telescope",

		requires = {
			{ "nvim-lua/popup.nvim", opt = true },
			{ "nvim-lua/plenary.nvim", opt = false },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
                -- make sure you have cmake and a C compiler installed
				run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
				opt = false
			}
		},
		wants = {
			"popup.nvim",
			"plenary.nvim",
			"telescope-fzf-native.nvim"
		},
		config = [[require("config.telescope")]]
	}

    -- Which Key
	use {
		"folke/which-key.nvim",
		config = [[require("config.which-key")]]
	}

    	-- Git Stuff
	use {
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim", opt = true },
		config = [[require("config.gitsigns")]]
	}

    -- Comments
	use {
		"terrortylor/nvim-comment",
		keys = {
			{ 'n', "<leader>c" },
			{ 'v', "<leader>c" }
		},
		config = [[require("config.nvim-comment")]]
	}

    -- Nvim tree
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = [[require("config.nvim-tree")]]
	}

	-- LSP
	use {
		"neovim/nvim-lspconfig",
		config = [[require("config.lsp")]]
	}

	-- Completion
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip"
		},
		config = [[require("config.nvim-cmp")]]
	}

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = [[require("config.nvim-treesitter")]]
	}

	-- Ergonomic terminal
	use {
		"akinsho/toggleterm.nvim",
		tag = '*',
		config = [[require("config.toggleterm")]]
	}

    
end,
config={
    auto_clean=true,
    compile_on_sync = true,
	ensure_dependencies = true,
	display = { open_cmd = "vnew \\[packer\\]" },
	profile = {	enable = false }
}})

return plugins