vim.cmd [[
imap <silent><script><expr> <C-Right> copilot#Accept("\<CR>")
imap <silent> <C-Left> <Plug>(copilot-dismiss)
imap <silent> <C-Up> <Plug>(copilot-next)
imap <silent> <C-Down> <Plug>(copilot-previous)
let g:copilot_no_tab_map = v:true
]]
