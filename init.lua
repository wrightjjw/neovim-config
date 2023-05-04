-- plugins file
require('plugins')

-- neovide
require('neovide')

-- lsp file
require('lsp')

-- keybinds
require('keybinds')

-- custom
require('custom')

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

-- conceal
vim.opt.conceallevel = 2

-- prefer horizontal splits for diffview (vertical monitor)
vim.opt.diffopt:append('horizontal')

-- set leader to space
vim.g.mapleader = ' '

-- set colorscheme
vim.opt.termguicolors = true
--if not vim.g.neovide then
--    vim.cmd.autocmd('ColorScheme * highlight Normal ctermbg=NONE guibg=NONE')
--end
vim.cmd.colorscheme('onedark')


-- spell in markdown
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.md"},
    callback = function ()
        vim.opt.spell = true
    end
})

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
