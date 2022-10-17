require("mason").setup {
    ensure_installed = { "pyright", "sumneko_lua", "jsonls"},
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}