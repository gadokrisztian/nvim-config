local common_config = require("user.lsp.handlers")

require("lspconfig").clangd.setup {
	--cmd = { "/usr/bin/clangd", "--background-index", "--cross-file-rename", "--header-insertion=never" },
	on_attach = common_config.common_on_attach,
	capabilities = common_config.capabilities,
	filetypes = { "c", "cpp", "objc" },
	rootPatterns = { ".git", "compile_flags.txt", "compile_commands.json" },
}