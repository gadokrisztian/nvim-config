local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("lspconfig is not available !")
	return
end

require("user.lsp.mason")