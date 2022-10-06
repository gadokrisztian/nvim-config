
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


vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc='Saves the file in normal mode.'})


vim.keymap.set({'n', 'x'}, 'cp', '"+y', {desc='Copy to clipboard.'})
vim.keymap.set({'n', 'x'}, 'cv', '"+p', {desc='Paste from clipboard.'})

vim.keymap.set({'n', 'x'}, 'x', '"_x', {desc='Delete without changing the registers.'})

vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>', {desc='Select all text in current buffer.'})


-- Install Packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end


-- Use packer
require('packer').startup(function (use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Theme inspired by Atom
  use 'joshdick/onedark.vim'

  -- Status line written in lua
  use 'nvim-lualine/lualine.nvim'

  if install_plugins then
    require('packer').sync()
  end
end)

if install_plugins then
  return
end


vim.opt.termguicolors = true
vim.cmd('colorscheme onedark')


require('lualine').setup({
  options= {
    icons_enabled = false,
    section_separators = '',
    component_separators=''
  }
})

