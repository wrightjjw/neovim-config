local plugins = require('packer').startup(function(use)
    -- packer itself
    use 'wbthomason/packer.nvim'

    -- auto pairs
    use 'jiangmiao/auto-pairs'

    -- color schemes
    use 'sickill/vim-monokai'
    use { 'navarasu/onedark.nvim',
        config = [[require('onedark').setup {
            colors = {
                grey = '#7c828c',
            },
        }]]
    }

    use 'ChristianChiarulli/nvcode-color-schemes.vim'
    use 'bluz71/vim-nightfly-colors'
    use 'bluz71/vim-moonfly-colors'
    use 'marko-cerovac/material.nvim'

    -- closetag.vim
    use { 'alvan/vim-closetag',
        config = { function()
            vim.g.closetag_filetypes = 'html,js,typescriptreact'
            vim.g.closetag_emptyTags_caseSensitive = 1
            vim.g.closetag_regions = {
                ['typescript.tsx'] = 'jsxRegion,tsxRegion',
                ['javascript.jsx'] = 'jsxRegion',
                ['typescriptreact'] = 'jsxRegion,tsxRegion',
                ['javascriptreact'] = 'jsxRegion',
            }
        end},
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

        config = [[
            if not vim.g.vscode then
                local cmp = require 'cmp'
                local luasnip = require 'luasnip'

                local has_words_before = function()
                    unpack = unpack or table.unpack
                    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                end

                cmp.setup {
                    --snippet engine (REQUIRED)
                    snippet = {
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body)
                        end,
                    },

                    -- completion mappings
                    mapping = {
                        ['<Tab>'] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            -- luasnip complete or jump to snippet value in region
                            elseif luasnip.expand_or_locally_jumpable() then
                                luasnip.expand_or_jump()
                            elseif has_words_before() then
                                cmp.complete()
                            else
                                fallback()
                            end
                        end, { "i", "s" }),

                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback() 
                            end 
                        end, { "i", "s" }),

                        ['<CR>'] = cmp.mapping.confirm({
                            behavior = cmp.ConfirmBehavior.Replace,
                            select = true,
                        }),
                    },

                    -- completion sources
                    sources = {
                        { name = 'luasnip' },
                        { name = 'path' },
                        { name = 'nvim_lsp' },
                        { name = 'buffer' },
                    },
                }
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_snipmate").lazy_load()
            end]],
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
    use { 'NeogitOrg/neogit',
        --use { 'Strongleong/neogit',
        --branch = 'fix_469'
        requires = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
        },

        config = [[require'neogit'.setup{
            integrations = {
                diffview = true,
            },
        }]]
    }
    use { 'tpope/vim-fugitive' } -- better for commits
    use { 'airblade/vim-gitgutter' } -- gutter

    use { 'sindrets/diffview.nvim',  -- diffing and merging
        requires = 'nvim-lua/plenary.nvim',
        config = [[require("diffview").setup({
            view = {
                default = {
                    layout = "diff2_vertical",
                },
                merge_tool = {
                    layout = "diff3_vertical",
                }
            }
        })]]
    }

    use { 'akinsho/git-conflict.nvim',
        config = [[require('git-conflict').setup()]]
    }

    -- go
    use { 'ray-x/go.nvim',
        branch = 'nvim_0.8',
        requires = {
            'nvim-treesitter/nvim-treesitter',
            'neovim/nvim-lspconfig',
        },

        config = [[require('go').setup()]]
    }

    -- image viewing
    if not vim.fn.has('win32') then
        use { 'edluffy/hologram.nvim',
            config = [[require('hologram').setup{
                auto_display = true, -- wip markdown display, apparently
            }]]
        }
    end

    -- markdown
    use 'preservim/vim-markdown'

    -- mason external package manager
    use { 'williamboman/mason.nvim',
        config = [[require('mason').setup()]]
    }

    -- lsp config (after mason for compatibility)
    use { 'neovim/nvim-lspconfig',
        --after = 'mason.nvim'
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

    -- neorg
    use { 'nvim-neorg/neorg',
        after = 'nvim-treesitter',
        config = function ()
            require('neorg').setup{
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {},
                },
            }
        end,
        run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim",
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

    -- table formatting
    use 'dhruvasagar/vim-table-mode'

    -- telescope
    use { 'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        config = [[require'telescope'.setup{
            defaults = {
                path_display={"truncate"}
            }
        }]],
    }

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter',
        run = function()
            vim.cmd("TSUpdate")
        end,

        config = [[require('nvim-treesitter.configs').setup{}]]
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

-- wiki config
vim.g.wiki_filetypes = { "md" }
vim.g.wiki_link_extension = ".md"


return plugins
