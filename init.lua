-- add config dir to load path
package.path = vim.fn['stdpath']('config') .. package.path

-- neovide
require('neovide')

-- plugins file
require('plugins')

-- lsp file
require('lsp')

-- keybinds
require('keybinds')

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- always yank to clipboard
vim.opt.clipboard:append('unnamedplus')

-- always tab with spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- set leader to space
vim.g.mapleader = ' '

-- set colorscheme
vim.opt.termguicolors = true
--if not vim.g.neovide then
--    vim.cmd.autocmd('ColorScheme * highlight Normal ctermbg=NONE guibg=NONE')
--end
vim.cmd.colorscheme('onedark')

vim.keymap.set('n', '<leader>bl', ':ls<cr>:b ')

-- initialize Mason
require('mason').setup()

-- remove legacy neotree commands (recommended)
vim.g.neo_tree_remove_legacy_commands = 1

require('neo-tree').setup({
    close_if_last_window = true,
    enable_git_status = true,
})

-- status file
require('status')
