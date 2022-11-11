require("user.preferences")
require("user.keymaps")
require("user.which-key")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.lualine")
require("user.toggleterm")
--require("user.dap")
require("user.tmux")
require("user.copilot")

-- Disable some built-in plugins
local disabled_built_ins = {
	"netrwPlugin",
	"tohtml",
	"man",
	"tarPlugin",
	"zipPlugin",
	"gzip" 
}

for _, k in ipairs(disabled_built_ins) do
	vim.g["loaded_" .. k] = 1
end

