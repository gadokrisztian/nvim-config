-- Colorscheme
vim.cmd[[colorscheme desert]]



vim.o.splitbelow = true                         -- splitting a window will put the new window below the current one.
vim.o.splitright = true                         -- splitting a window will put the new window right of the current one.
vim.o.textwidth=90                              -- wrap text at 90 characters
vim.opt.wrap = true                             -- lines longer than the width of the window will wrap
vim.opt.breakindent = true                      -- every wrapped line will continue visually indented
vim.opt.wrapscan = true                         -- searches wrap around end-of-file
vim.o.foldmethod="expr"                         -- folding method is expression based
--vim.o.foldexpr="nvim_treesitter#foldexpr()"     -- folding is based on treesitter
vim.o.foldnestmax=3                             -- maximum number of nested folds
vim.o.autoindent=true                           -- indent according to previous line
vim.o.tabstop=4                                 -- number of spaces a tab counts for
vim.o.shiftwidth=4                              -- number of spaces to use for autoindent
vim.o.softtabstop=4                             -- number of spaces to use for autoindent
vim.o.expandtab=true                            -- use spaces instead of tabs
vim.o.smarttab=true                             -- smart tabbing
vim.o.shiftround=true                           -- round indent to multiple of shiftwidth
vim.opt.ignorecase = true                       -- ignore case when searching
vim.opt.smartcase = true                        -- ignore case unless search term contains capital letters
vim.opt.hlsearch = false                        -- don't highlight search results
vim.opt.incsearch = true                        -- show search results as you type
vim.opt.backspace = {'indent', 'eol', 'start'}  -- allow backspacing over everything in insert mode
vim.opt.nrformats = vim.o.nrformats .. ',alpha' -- allow letters in number columns
vim.opt.hidden = true                           -- switch between buffers without having to save first.
vim.opt.laststatus = 2                          -- always show status line
vim.opt.display = vim.opt.display + "lastline"  -- show as much as possible of the last line.
vim.opt.showmode = true                         -- show current mode in status line
vim.opt.showcmd = true                          -- show already typed keys when more are expected.
-- vim.opt.ttyfast = false                      -- faster redrawing but may cause problems with some terminals
vim.opt.lazyredraw = true                       -- don't redraw while executing macros
vim.opt.report = 0                              -- always report changed lines
vim.opt.backup = false                          -- don't create backup files
vim.opt.writebackup = false                     -- don't make backup file before writing
vim.opt.swapfile = false                        -- don't create swap files
vim.opt.number = true                           -- show line numbers
vim.opt.relativenumber = true                   -- show relative line numbers
vim.opt.formatoptions='tcq'                     -- don't auto-wrap comments
vim.opt.ruler = true                            -- show cursor position
vim.opt.wildmenu = true                         -- show command line completion options
vim.opt.clipboard = 'unnamedplus'               -- use system clipboard
vim.opt.encoding = 'utf-8'                      -- use utf-8 encoding
vim.opt.fileencoding = 'utf-8'                  -- use utf-8 encoding
vim.opt.termencoding = 'utf-8'                  -- use utf-8 encoding
vim.opt.fileformats = 'unix,dos,mac'            -- use unix line endings
vim.opt.shortmess = 'a'                         -- use abbrieviated messages in the command line
vim.opt.cmdheight = 2                         -- show command line only when needed
vim.opt.scrolloff = 8                           -- number of screen lines to keep above and below the cursor
vim.wo.signcolumn = "yes"                       -- always show sign column
vim.wo.cursorline = true                        -- highlight current line
vim.opt.timeoutlen = 500                        -- time to wait for a mapped sequence to complete
vim.opt.updatetime = 500                        -- time to wait before swapfile is saved or LSP update
vim.opt.mouse = 'a'                             -- enable mouse support in all modes
vim.opt.pumheight = 10                          -- pop up menu height
vim.g.python3_host_prog = "/usr/bin/python3"
vim.o.filetype = "plugin"                      -- set filetype to plugin

