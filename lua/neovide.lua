if vim.g.neovide then
    -- settings
    vim.opt.guifont = { "CaskaydiaCove NF", "h10" }
    vim.g.neovide_scale_factor = 0.8

    vim.g.neovide_transparency = 0.85

    local scale_factor = 0.1

    -- keybinds
    local wk = require('which-key')
    wk.register({
        -- fullscreen
        ["<f11>"] = {
            function()
                vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
            end, "Toggle Fullscreen"
        },

        -- zoom (not working)
        ["C-="] = {
            function()
                print('yes!')
                vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + scale_factor
            end, "Zoom in"
        },
        ["C--"] = {
            function()
                vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - scale_factor
            end, "Zoom out"
        },
    })

    -- zoom
    wk.register({
    })
end
