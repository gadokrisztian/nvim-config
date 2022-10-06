-- Bootstrap
local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print("Downloading Packer ...")
	vim.fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
	vim.api.nvim_command("packadd packer.nvim")
	require("config.packer")
	require("packer").sync()
	return
end

require("impatient")

-- Set leader
vim.g.mapleader = ' '

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd[[colorscheme onedark]]

vim.opt.number = true
vim.opt.mouse = 'a'

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc='Saves the file in normal mode.'})
vim.keymap.set({'n', 'x'}, 'cp', '"+y', {desc='Copy to clipboard.'})
vim.keymap.set({'n', 'x'}, 'cv', '"+p', {desc='Paste from clipboard.'})
vim.keymap.set({'n', 'x'}, 'x', '"_x', {desc='Delete without changing the registers.'})
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>', {desc='Select all text in current buffer.'})

-- For LSP
vim.o.hidden = true
vim.o.updatetime = 300
vim.o.backup = false
vim.o.writebackup = false

-- Which-key Delay
vim.o.timeoutlen = 100

-- Generic
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.scrolloff = 8
vim.o.showmode = false
vim.o.splitright = true
vim.o.termguicolors = true


-- local generic_augroup = vim.api.nvim_create_augroup("config_generic", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	group = generic_augroup,
-- 	callback = function()
-- 		if vim.o.buftype ~= "terminal" then
-- 			vim.cmd("lcd %:p:h")
-- 		end
-- 	end
-- })
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	group = generic_augroup,
-- 	callback = function()
-- 		vim.highlight.on_yank({higroup = "IncSearch",
-- 							   timeout = 150,
-- 							   on_visual = true})
-- 	end
-- })

-- Disable some built-in plugins
local disabled_built_ins = {
	"netrwPlugin",
	"tohtml",
	"man",
	"tarPlugin",
	"zipPlugin",
	"gzip"
}

for i = 1, table.maxn(disabled_built_ins) do
	vim.g["loaded_" .. disabled_built_ins[i]] = 1
end
