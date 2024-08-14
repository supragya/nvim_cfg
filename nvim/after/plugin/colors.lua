colormode = 'dark'
function ColorMySystem(color)
    color = color or "gruvbox"

    vim.cmd('set background='..colormode)
    vim.cmd.colorscheme(color)

    -- Sets the background transparent
    -- -- vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

function FlipColorMode()
    if colormode == 'dark' then
        colormode = 'light'
    else
        colormode = 'dark'
    end

    vim.cmd('set background='..colormode)
end

ColorMySystem()
-- FlipColorMode()
-- vim.keymap.set('n', '<C-d>', ":lua FlipColorMode()", {desc = "Flips colormode light or dark"})
