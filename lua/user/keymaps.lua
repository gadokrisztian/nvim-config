-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local opts = {noremap = true, silent = true}
local term_opts = {silent = true }

local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


-- Navigate buffers
keymap("n", "<Tab>", ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>", opts)
keymap("n", "<S-Tab>", ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>", opts)

-- Close everything except current buffer
keymap("n", "<C-A>", ":w <bar> %bd <bar> e# <bar> bd# <CR><CR>", opts)

keymap("n", "<S-Space", "za", opts)

keymap({'n', 'x'}, 'y', '"+y', {noremap=true, silent=true, desc='Copy to clipboard.'})
keymap({'n', 'x'}, 'p', '"+p', {noremap=true, silent=true, desc='Paste from clipboard.'})
keymap({'n', 'x'}, 'x', '"_x', {noremap=true, silent=true, desc='Delete without changing the registers.'})
--keymap('n', '<leader>a', ':keepjumps normal! ggVG<cr>', {desc='Select all text in current buffer.'})

-- Inser --
-- Press jk fast to escape
keymap("i", "jk", "<ESC>", opts)
keymap("i", "JK", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = "Telescope Find Files" })
keymap('n', '<leader>fg', '<cmd>telescope live_grep<cr>', { desc = "Telescope Grep" })
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = "Telescope Buffers" })
keymap('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = "Telescope MRU" })
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = "Telescope Help" })
keymap('n', '<leader>fs', '<cmd>Telescope possession list<cr>', { desc = "Telescope Posession" })