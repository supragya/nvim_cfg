vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-!>', ":bprev<cr>", { desc = 'Move focus to the previous buffer' })
vim.keymap.set('n', '<C-@>', ":bnext<cr>", { desc = 'Move focus to the previous buffer' })

vim.keymap.set('n', '<leader>cm', ":lua FlipColorMode()<cr>", {desc = "Flips colormode light or dark"})

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<leader>tt', ":NvimTreeToggle<cr>", {})

vim.keymap.set('n', 'ta', ':lua require("neotest").run.run(vim.fn.expand("%"))<cr>', opts)  -- Test All
vim.keymap.set('n', 'tc', ':lua require("neotest").run.run()<cr>', opts)  -- Test Case
vim.keymap.set('n', 'to', ':lua require("neotest").output.open({ enter = true })<cr>', opts) -- Toggle Output (Hovering)
vim.keymap.set('n', 'tpt', ':lua require("neotest").output_panel.toggle()<cr>', opts) -- Toggle Output Panel
vim.keymap.set('n', 'tpc', ':lua require("neotest").output_panel.clear()<cr>', opts) -- Toggle Output Clear

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
