local common_config = require("user.lsp.handlers")

require("lspconfig").rust_analyzer.setup {
	--cmd = { "/usr/bin/rust-analyzer" },
	on_attach = common_config.common_on_attach,
	capabilities = common_config.capabilities,
	filetypes = { "rust" },
}