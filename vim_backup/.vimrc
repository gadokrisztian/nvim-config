call plug#begin()
Plug 'preservim/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'

Plug 'sheerun/vim-polyglot'

Plug 'dhruvasagar/vim-table-mode'
Plug 'navarasu/onedark.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'drewtempelmeyer/palenight.vim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'github/copilot.vim'
call plug#end()


lua << END
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
END

set background=dark
colorscheme palenight

set termguicolors
set t_Co=256


let mapleader='-'

" Reload the current file
nnoremap <leader>s :w<CR>:so %<CR>
nnoremap <leader>v :e ~/.vimrc<CR>
inoremap <nowait> <C-d> <Esc>:w<CR><F9>

inoremap <nowait> jk <Esc>
inoremap <nowait> JK <Esc>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
vnoremap <C-i> g<C-A>

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" navigate between windows
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <silent> vv <C-w>v

" resize windows
nnoremap <C-Left> <C-W><
nnoremap <C-Right> <C-W>>
nnoremap <C-Up> <C-W>+
nnoremap <C-Down> <C-W>-

" noremap <F8> zm
" C-F8
" noremap <F32>> zr
nnoremap <Space> za

filetype plugin on
set nocompatible
set splitbelow
set splitright
set textwidth=90
set foldmethod=indent      " code folding for python
set foldnestmax=3          " don't fold class methods
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =2         " Tab key indents by 2 spaces.
set shiftwidth  =2         " >> indents by 2 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set nrformats+=alpha       " enable increment characters

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.
syntax on                  " Enable syntax highlighting.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set nohlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new xindows below the current window.
set splitright             " Open new windows right of the current window.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set nobackup
set noswapfile
set number relativenumber
set formatoptions=tcq
set ruler
syntax on
set hidden
set wildmenu "a better menu in command mode
set clipboard=unnamedplus
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
"set lines=999 columns=999 " full windows
set smartcase


set shortmess=a
set cmdheight=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" Markdown
autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab

" Makefile
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" EDYSON
autocmd FileType omnimark set nowrap

" PYTHON RELATED
let g:python3_host_prog='/usr/bin/python3'

autocmd BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=120 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

" run script in normal mode with F9
" in vim terminal
" autocmd FileType python nnoremap <buffer> <C-F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" in tmux pane
autocmd FileType python nnoremap <buffer> <F9> :w<CR>:call VimuxRunCommand('clear;python3.9 -B '.bufname("%"))<CR>

" run script with pudb
autocmd FileType python nnoremap <buffer> <F12> :w<CR>:call VimuxRunCommand('tmux new-window -n DEBUG "python3.9 -B -m pudb '.bufname('%').'"')<CR>
autocmd FileType python nnoremap <buffer> <C-F12> :w<CR>:call VimuxRunCommand('tmux new-window -n DEBUG "python3.9 -B -m pytest -s -v '.bufname('%').'"')<CR>

" pytest
autocmd FileType python nnoremap <buffer> <C-F6> :w<CR>:call VimuxRunCommand("clear;python3.9 -m pytest -s -v ".bufname("%"))<CR>
autocmd FileType python nnoremap <buffer> <F6> :w<CR>:call VimuxRunCommand("clear;python3.9 -B -m pytest -v ".bufname("%"))<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LATEX
autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <F5> :w<CR>:exec "! ./build.sh"<CR>


" CtrlP
"
" let g:ctrlp_cmd='CtrlP :pwd'
" let g:ctrlp_extensions=['line', 'tag']
" nnoremap <M-p> :CtrlPLine<CR>
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|venv|.venv|.idea|htmlcov|__pycache__)|(\.(swp|ico|git|svn))$'

" KEYS
" Switch back to normal mode from terminal
tnoremap <Esc> <C-\><C-n>

" switching between buffers with TAB ans Shift+TAB
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Close buffer without closing the current window
command! Bd :bn|:bd#
cnoreabbrev bd Bd

" Close all buffer except current
nnoremap <silent> <leader>ca :w <bar> %bd <bar> e# <bar> bd# <CR><CR>


" Airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#ctrlspace#enabled = 1
" let g:CtrlSpaceStatuslineFunction ="airline#extensions#ctrlspace#statusline()"

" Cursor
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' | 
        \   silent execute '!echo -ne "\e[6 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[4 q"' | redraw! |
        \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif


" COC
set completeopt=longest,menuone

" Use <tab> and <S-tab> to navigate completion list:
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <CR> to confirm completion, use
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"


" To make <CR> to confirm selection of selected complete item or notify coc.nvim
" to format on enter, use: >
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" SNIPPETS
let g:ultisnips_python_style = 'google'
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" AUTOCMDS
autocmd FileType python let b:coc_root_patterns = ['.git', 'venv', 'htmlcov', '__pycache__', '.venv']


" COMMENT TOGGLE
noremap <leader>q :Commentary<cr>j^


" NERDTREE
let NERDTreeDirArrowExpandable=""
let NERDTreeDirArrowCollapsible=""

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>



" NERDTree Plugins
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowClean = 1 " default: 0

" Devicons

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" change the default open folder/directory glyph/icon (default is '')
let g:DevIconsDefaultFolderOpenSymbol = 'ƛ'

let g:WebDevIconsOS = 'Ubuntu'


" HASKELL
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

autocmd FileType haskell nnoremap <buffer> <F9> :w<CR>:call VimuxRunCommand('clear;ghc --make '.bufname("%").";./".expand("%:t:r"))<CR>


let g:table_mode_cornder = '|'


" Find files using Telescope command-line sugar.
nnoremap <leader>sf <cmd>Telescope find_files<cr>
nnoremap <leader>st <cmd>Telescope live_grep<cr>
nnoremap <leader>sb <cmd>Telescope buffers<cr>
nnoremap <leader>sh <cmd>Telescope help_tags<cr>
nnoremap <leader>sh <cmd>Telescope help_tags<cr>
nnoremap <leader>ss <cmd>Telescope lsp_document_symbols<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>


" Copilot

imap <silent><script><expr> <C-Right> copilot#Accept("\<CR>")
imap <silent> <C-Left> <Plug>(copilot-dismiss)
imap <silent> <C-Up> <Plug>(copilot-next)
imap <silent> <C-Down> <Plug>(copilot-previous)

let g:copilot_no_tab_map = v:true
