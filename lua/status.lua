if not vim.g.vscode then
    vim.opt.showmode = false
    require('feline').setup()
    require('feline').winbar.setup()
end
