-- require("conform").setup({
--     notify_on_error = false,
--       format_on_save = function(bufnr)
--         -- Disable "format_on_save lsp_fallback" for languages that don't
--         -- have a well standardized coding style. You can add additional
--         -- languages here or re-enable it for the disabled ones.
--         local disable_filetypes = { c = true, cpp = true }
--         return {
--           timeout_ms = 500,
--           lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
--         }
--       end,
--       formatters_by_ft = {
--         lua = { 'stylua' },
--         -- Conform can also run multiple formatters sequentially
--         python = { 'isort', 'black' },
--         --
--         -- You can use a sub-list to tell conform to run *until* a formatter
--         -- is found.
--         javascript = { { 'prettierd', 'prettier' } },
--         rust = { 'rustfmt' },
--         toml = { 'taplo' },
--     },
-- })
require("conform").setup({
    formatters_by_ft = {
        lua = {'stylua'},
        -- Conform can also run multiple formatters sequentially
        python = {'isort', 'black'},
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = {{'prettierd', 'prettier'}},
        rust = {'rustfmt'},
        toml = {'taplo'}
    }
})

require("conform").formatters.rustfmt = {
    prepend_args = function(self, ctx)
        -- return {"--config",
        --         "chain_width=0,fn_params_layout=Vertical,force_multiline_blocks=true,imports_layout=Vertical,max_width=80,merge_derives=false,merge_imports=true,reorder_impl_items=true"}
    end
}

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({
            bufnr = args.buf
        })
    end
})
