local wk = require("which-key")

-- Keybinds for NO VSCODE
if not vim.g.vscode then

    -- lsp
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            wk.register({
                l = {
                    name = "LSP",
                    h = { vim.lsp.buf.hover, "Hover", buffer = args.buf },
                    f = { vim.lsp.buf.format, "Format", buffer = args.buf },
                    r = { vim.lsp.buf.references, "Find references", buffer = args.buf },
                    i = { vim.lsp.buf.implementation, "Find implementations", buffer = args.buf },
                    a = { vim.lsp.buf.code_action, "Code Actions", buffer = args.buf },
                    d = {
                        name = "Diagnostics",
                        n = { vim.diagnostic.goto_next, "Go to next diagnostic", buffer = args.buf },
                        p = { vim.diagnostic.goto_prev, "Go to previous diagnostic", buffer = args.buf },
                        o = { vim.diagnostic.open_float, "Open diagnostic popup", buffer = args.buf },
                    }
                }
            }, { prefix = "<leader>" })

            wk.register({
                ["gd"] = {
                    name = "Diagnostics",
                    n = { vim.diagnostic.goto_next, "Go to next diagnostic", buffer = args.buf },
                    p = { vim.diagnostic.goto_prev, "Go to previous diagnostic", buffer = args.buf },
                },
                ["<leader>d"] = { vim.diagnostic.open_float, "Open diagnostic popup", buffer = args.buf },
            }, {})
        end,
    })

    -- Leader
    --wk.register({
    --    l = {
    --        name = "LSP",
    --        h = { vim.lsp.buf.hover, "Hover" },
    --        f = { vim.lsp.buf.format, "Format" },
    --        r = { vim.lsp.buf.references, "Find references" },
    --        i = { vim.lsp.buf.implementation, "Find implementations" },
    --        a = { vim.lsp.buf.code_action, "Code Actions" },
    --    }
    --}, { prefix = "<leader>" })

end

-- GLOBAL keybinds
wk.register({
    ["<c-h>"] = { "<cmd>noh<cr>", "Clear search highlight" },

    ["<leader>"] = {
        g = { "<cmd>Neogit<cr>", "Neogit" },
    }
})
