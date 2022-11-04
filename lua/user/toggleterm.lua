local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-/>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local ipython = Terminal:new({ cmd = "ipython", hidden = true })

local python = Terminal:new({
    cmd="python "..vim.fn.expand('%:p'),
    hidden = false,
    close_on_exit = false,
    auto_scroll = true,
})

local node = Terminal:new({ cmd = "node", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

function _IPYTHON_TOGGLE()
	ipython:toggle()
end

function _PYTHON_TOGGLE()
	python:toggle()
end


local wk = require("which-key")

wk.register({
    ["<leader>"] = {
        r = {
            name='Run',
            p={ _PYTHON_TOGGLE, "Python" },
            l={ _LAZYGIT_TOGGLE, "Lazygit" },
            i={ _IPYTHON_TOGGLE, "Ipython" },
        },
    },
})
