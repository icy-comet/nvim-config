local M = {
    "neovim/nvim-lspconfig",
    config = function()
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<space>xf', vim.diagnostic.open_float, { desc = "Open Floating Diags" })
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Next Diag" })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Prev Diag" })
        -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, {desc = ""})

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to Declaration" })
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to Definition" })
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Go to Imlementation" })
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = "See References" })
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<space>pl', function()
                    vim.lsp.buf.format { async = true }
                end, {buffer = ev.buf, desc = "LSP Format Buffer"})
            end,
        })
    end
}

return M
