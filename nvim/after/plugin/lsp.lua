local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.setup_servers({
    'gopls',
    'rust_analyzer',
})

-- lsp.setup_nvim_cmp({
--     preselect = 'none',
--     completion = {
--         completeopt = 'menu,menuone,noinsert,noselect'
--     },
-- })

local cmp = require('cmp')

require('cmp').setup {
    completion = { completeopt = 'menu,menuone,noinsert' },
    mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Scroll the documentation window [b]ack / [f]orward
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<C-y>'] = cmp.mapping.confirm { select = true },

        -- If you prefer more traditional completion keymaps,
        -- you can uncomment the following lines
        --['<CR>'] = cmp.mapping.confirm { select = true },
        --['<Tab>'] = cmp.mapping.select_next_item(),
        --['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
}
-- cmp.preselectMode = 'Item'
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local com_mappings = lsp.defaults.cmp_mappings({
--     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<C-y>'] = cmp.mapping.confirm({ select = true }),

--     -- ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
--     -- ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
--     -- ['<CR>'] = cmp.mapping.confirm({ select = true }),

--     ['<C-Space>'] = cmp.mapping.complete(),
-- })

lsp.on_attach(function(client, bufnr)

    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set('n', 'ld', function() vim.lsp.buf.definition() end, opts) -- Definition;
    vim.keymap.set('n', 'lD', function() vim.lsp.buf.declaration() end, opts) -- Declaration;
    vim.keymap.set('n', 'lr', function() vim.lsp.buf.references() end, opts) -- References
    vim.keymap.set('n', 'lc', function() vim.lsp.buf.rename() end, opts)  -- Change / Rename
  

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts) -- Know / Hover

    vim.keymap.set('n', 'lh', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, opts)

    -- vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    -- vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    -- vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    -- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    -- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    -- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    -- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    -- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
end)

lsp.setup()
