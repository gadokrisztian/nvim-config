local servers = { "lua_ls", "rust_analyzer", "ocamllsp", "pyright", "volar", "tsserver", "gopls", "clangd" };


return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {                            -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
                require("mason").setup {
                    ensure_installed = servers,
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗"
                        }
                    }
                }
            end,
        },
        'williamboman/mason-lspconfig.nvim', -- Optional

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            config = function()
                --load vscode style snippets
                require("luasnip/loaders/from_vscode").lazy_load()
                local cmp = require('cmp')
                cmp.setup({
                    mapping = {
                        ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    }
                })
            end

        },                          -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
    },
    config = function()
        local lsp = require('lsp-zero')
        lsp.ensure_installed(servers)
        lsp.preset({
            manage_nvim_cmp = {
                set_sources = 'recommended'
            }
        })
        lsp.setup()
    end
}