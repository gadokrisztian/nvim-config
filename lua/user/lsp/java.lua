local common_config = require("user.lsp.handlers")

require("lspconfig").jdtls.setup {
	single_file_support = true,
	--cmd = { "jdtls" },
	on_attach = common_config.common_on_attach,
	capabilities = common_config.capabilities,
	filetypes = { "java" },
	rootPatterns = { ".git", "build.gradle", "pom.xml" }
}
