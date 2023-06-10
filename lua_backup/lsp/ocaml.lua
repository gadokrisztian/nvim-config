local common_config = require("user.lsp.handlers")

require("lspconfig").ocamllsp.setup {
	single_file_support = true,
	on_attach = common_config.common_on_attach,
	capabilities = common_config.capabilities,
	filetypes = { "ocaml" },
}