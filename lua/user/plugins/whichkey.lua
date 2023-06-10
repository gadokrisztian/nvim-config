return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        require("which-key").setup {
            plugins = {
                marks = true,
                registers = true,
                spelling = {
                    enabled = true,
                    suggestions = 36,
                },
                presets = {
                    operators = false,
                    motions = false,
                    text_objects = false,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true,
                },
            },
            key_labels = {
                ["<space>"] = "SPC",
                ["<cr>"] = "RET",
                ["<Tab>"] = "TAB",
            },
            icons = {
                breadcrumb = "»",
                separator = "➜",
                group = "+",
            },
            window = {
                border = "single",
                position = "bottom",
                margin = { 1, 0, 1, 0 },
                padding = { 0, 2, 0, 2 },
            },
            layout = {
                height = { min = 4, max = 25 },
                width = { min = 20, max = 50 },
                spacing = 3,
                align = "left",
            },
            ignore_missing = false,
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
            show_help = true,
            triggers = "auto",
            triggers_blacklist = {
                i = { "j", "k" },
                v = { "j", "k" },
            },
        }
    end
}
