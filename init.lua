
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

  -- Devicons
  use 'kyazdani42/nvim-web-devicons'

  -- Toggle comments in code
  use 'numToStr/Comment.nvim'

  -- filter list of items
  use 'nvim-telescope/telescope.nvim'

  -- fzf native plugin for telescope
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  if install_plugins then
    require('packer').sync()
  end
end)

if install_plugins then
  return
end


vim.opt.termguicolors = true
vim.cmd('colorscheme onedark')



require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
      'buffers',
      show_filename_only = true,
      hide_filename_extension = false,
      show_modified_status = true,
      mode = 0,
      symbols = {
        modified = '●',
        directory = '/',
        alternate_file=''
      }
     }
    },
    lualine_z = {'tabs'}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
