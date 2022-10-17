local common_config = require("user.lsp.handlers")

require("lspconfig").sumneko_lua.setup {
	single_file_support = true,
	--cmd = { "/usr/bin/lua-language-server" },
	on_attach = common_config.common_on_attach,
	capabilities = common_config.capabilities,
	filetypes = { "lua" },
	rootPatterns = { ".git" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ';')
			},
			diagnostics = {
				globals = { "vim", "Config" }
			},
			workspace = {
				library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true},
				maxPreload = 10000
			},
			telemetry = {
				enable = false
			}
		}
	}
}