return {
    "savq/melange-nvim",
    init=function ()
        vim.opt.termguicolors = true
        vim.cmd.colorscheme 'melange'
    end
}