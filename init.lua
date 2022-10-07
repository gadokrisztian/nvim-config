-- Bootstrap
local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print("Downloading Packer ...")
	vim.fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
	vim.api.nvim_command("packadd packer.nvim")
	require("config.packer")
	require("packer").sync()
end

require("config.preferences")
require("config.key_maps")
require("impatient")




-- local generic_augroup = vim.api.nvim_create_augroup("config_generic", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	group = generic_augroup,
-- 	callback = function()
-- 		if vim.o.buftype ~= "terminal" then
-- 			vim.cmd("lcd %:p:h")
-- 		end
-- 	end
-- })
--
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
