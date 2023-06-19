return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "lua", "vim", "python", "rust", "zig", "kotlin", "yaml", "ocaml", "c" },
            auto_install = true,
            sync_install = false,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },

            indent = {
                disable = true,
            },

            rainbow = {
                disable = false,
                extended_mode = true
            },
            context_commentstring = {
                enable = false
            }
        }
    end
}
