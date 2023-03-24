local plugins = require('packer').startup(function(use)
    -- packer itself
    use 'wbthomason/packer.nvim'

    -- color schemes
    use 'sickill/vim-monokai'
    use { 'navarasu/onedark.nvim',
        require('onedark').setup {
            colors = {
                grey = '#7c828c',
            },
        }
    }

    -- completion
    use { 'hrsh7th/nvim-cmp',
        require = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
        },
    }

    use { 'L3MON4D3/LuaSnip',
    }
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'

    -- debugging
    use 'mfussenegger/nvim-dap'

    -- git integration
    use { 'TimUntersberger/neogit',
        --use { 'Strongleong/neogit',
        --branch = 'fix_469'
        config = [[require'neogit'.setup{}]]
    }
    use { 'tpope/vim-fugitive' } -- better for commits
    use { 'airblade/vim-gitgutter' } -- gutter

    use { 'sindrets/diffview.nvim',  -- diffing and merging
        requires = 'nvim-lua/plenary.nvim',
        config = require("diffview").setup({
            view = {
                default = {
                    layout = "diff2_vertical",
                },
                merge_tool = {
                    layout = "diff3_vertical",
                }
            }
        })
    }

    use { 'akinsho/git-conflict.nvim',
        config = [[require('git-conflict').setup()]]
    }

    -- lsp config
    use 'neovim/nvim-lspconfig'

    -- markdown
    use 'preservim/vim-markdown'

    -- mason external package manager
    use { 'williamboman/mason.nvim',
        config = require('mason').setup()
    }

    -- neotree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            -- remove legacy neotree commands (recommended)
            vim.g.neo_tree_remove_legacy_commands = 1

            require('neo-tree').setup({
                close_if_last_window = true,
                enable_git_status = true,
            })

            vim.api.nvim_set_keymap("", "<f2>", ":Neotree toggle<cr>",
                { silent = false, noremap = true, desc = "toggle Neotree" })
        end
    }

    -- org mode
    use { 'nvim-orgmode/orgmode',
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require('orgmode').setup_ts_grammar()
            require('orgmode').setup {}
        end
    }

    -- snippets
    use 'rafamadriz/friendly-snippets'
    use 'honza/vim-snippets'

    -- status line
    use 'feline-nvim/feline.nvim'

    -- telescope
    use { 'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
    }

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter',
        run = function()
            vim.cmd("TSUpdate")
        end
    }

    -- web devicons
    use 'nvim-tree/nvim-web-devicons'

    -- which key
    use { 'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500

            require("which-key").setup()
        end
    }

    -- wiki.vim
    use 'lervag/wiki.vim'
end)

-- cmp config
if not vim.g.vscode then
    local cmp = require 'cmp'
    cmp.setup {
        --snippet engine (REQUIRED)
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },

        -- completion mappings
        mapping = {
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            })
        },

        -- completion sources
        sources = {
            { name = 'luasnip' },
            { name = 'path' },
            { name = 'nvim_lsp' },
            { name = 'buffer' },
        },
    }
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

-- wiki config
vim.g.wiki_filetypes = { "md" }
vim.g.wiki_link_extension = ".md"


return plugins
