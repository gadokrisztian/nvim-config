require 'nvim-treesitter.install'.compilers = { vim.fn.getenv('CC'), "cc", "gcc", "clang", "cl", "zig"}

require("nvim-treesitter.configs").setup {
	ensure_installed =  { "python", "lua", "ocaml", "yaml", "json"},
  	auto_install = true,
	sync_install=false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},

	indent = {
		disable = false,
	},

	rainbow = {
		disable = false,
		extended_mode = true
	},
	context_commentstring = {
		enable = true
	}
}
