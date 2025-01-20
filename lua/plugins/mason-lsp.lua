local M = {
    "williamboman/mason-lspconfig.nvim",
    dependenices = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local masonLsp = require("mason-lspconfig")
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        masonLsp.setup({
                ensure_installed = {
                    "pyright",
                    "lua_ls",
                    "bashls",
                    "clangd",
                    -- "cmake",
                    "cssls",
                    "dockerls",
                    "docker_compose_language_service",
                    "gopls",
                    "html",
                    "jsonls",
                    "kotlin_language_server",
                    -- "autotools_ls",
                    "powershell_es",
                    "sqlls",
                    "taplo",
                    "biome",
                    "lemminx",
                    "hydra_lsp"
                },
        })
        masonLsp.setup_handlers({
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function (server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {capabilities = capabilities, inlay_hints = {dynamicRegsitration = false}}
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            -- ["rust_analyzer"] = function ()
            --    require("rust-tools").setup {}
            -- end
        })
    end
}

return M
