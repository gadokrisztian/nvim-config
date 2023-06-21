return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup {
            signs = {
                add          = { hl = "GitSignsAdd", text = '│', numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                change       = {
                    hl = "GitSignsChange",
                    text = '│',
                    numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn"
                },
                delete       = {
                    hl = "GitSignsDelete",
                    text = '_',
                    numhl = "GitSignsDeleteNr",
                    linehl =
                    "GitSignsDeleteLn"
                },
                topdelete    = {
                    hl = "GitSignsDelete",
                    text = '‾',
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn"
                },
                changedelete = {
                    hl = "GitSignsChange",
                    text = '~',
                    numhl = "GitSignsChangeNr",
                    linehl =
                    "GitSignsChangeLn"
                },
            },
            signcolumn = true,          -- Toggle with `:Gitsigns toggle_signs`
            numhl = false,              -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false,             -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false,          -- Toggle with `:Gitsigns toggle_word_diff`
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000,
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            -- keymaps = {
            --     noremap = true,
            --     buffer = true,
            -- },
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter_opts = {
                relative_time = false,
            },
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
            yadm = {
                enable = false,
            },
            diff_opts = {
                internal = true
            },
            on_attach = function(bufnr)
                local opts = { buffer = bufnr, noremap = true, silent = true }
                local maps = {
                    ["<leader>g"] = {
                        name = "Git",
                        j = { "<cmd>lua require ('gitsigns').next_hunk()<cr>", "Next Hunk" },
                        k = { "<cmd>lua require ('gitsigns').prev_hunk()<cr>", "Prev Hunk" },
                        l = { "<cmd>lua require ('gitsigns').blame_line()<cr>", "Blame" },
                        p = { "<cmd>lua require ('gitsigns').preview_hunk()<cr>", "Preview Hunk" },
                        r = { "<cmd>lua require ('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
                        R = { "<cmd>lua require ('gitsigns').reset_buffer()<cr>", "Reset Buffer" },
                        s = { "<cmd>lua require ('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
                        u = {
                            "<cmd>lua require ('gitsigns').undo_stage_hunk()<cr>",
                            "Undo Stage Hunk",
                        },
                    },
                    -- ["<leader>f"] = {
                    --     p = { "<cmd>Telescope git_files<CR>", "Git Files" }
                    -- },
                    -- ["<c-p>"] = { "<cmd>Telescope git_files<CR>", "Git Files" }
                }
                require("which-key").register(maps, opts)
            end
        }
    end,
}
