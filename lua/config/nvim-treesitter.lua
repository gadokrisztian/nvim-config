require 'nvim-treesitter.install'.compilers = { vim.fn.getenv('CC'), "cc", "gcc", "clang", "cl", "zig"}
--require('nvim-treesitter.install').compilers = { }

require("nvim-treesitter.configs").setup {
	ensure_installed =  { "python", "lua"},
  auto_install = true,

	highlight = {
		enable = false
	}
}
