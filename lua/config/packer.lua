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

    -- Devicons
    use 'kyazdani42/nvim-web-devicons'
    
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

    
end,
config={
    auto_clean=true
}})