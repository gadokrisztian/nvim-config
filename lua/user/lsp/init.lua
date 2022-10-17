
require("user.lsp.mason")
require("mason-lspconfig").setup {
    ensure_installed = {"pyright", "jsonls", "sumneko_lua", "rust_analyzer" },
    automatic_installation = true
}

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("lspconfig is not available !")
	return
end

require("user.lsp.handlers")


-- Diagnostics symbols for display in the sign column.
vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "✖", numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "❢", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "𝓲", numhl = "DiagnosticSignInfo" })

-- Diagnostics config
vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	float = {
		scope = "cursor",
		border = "single",
		header = "",
		prefix = "",
		focusable = false
	}
})

-- Setup Servers
require("user.lsp.python")
require("user.lsp.c")
require("user.lsp.java")
require("user.lsp.rust")
require("user.lsp.ocaml")