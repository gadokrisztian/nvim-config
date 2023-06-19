local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Disable some built-in plugins
local disabled_built_ins = {
	"netrwPlugin",
	"tohtml",
	"man",
	"tarPlugin",
	"zipPlugin",
	"gzip",
}

for _, k in ipairs(disabled_built_ins) do
	vim.g["loaded_" .. k] = 1
end

require("user.preferences")
require("user.keymaps")
require("lazy").setup({
  spec = {
    { import = "user.plugins"},
  }
})

require("user.configs.cmp")




