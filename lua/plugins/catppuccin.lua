local M = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            integrations = {
                nvimtree = true,
                treesitter = true,
                harpoon = true,
                indent_blankline = {
                    enabled = true,
                    scope_color = "lavender",
                    colored_indent_levels = false,
                },
                telescope = {
                    enabled = true,
                },
                lsp_trouble = true,
                cmp = true,
                mason = true,
                gitsigns = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
            }
        })
        vim.cmd.colorscheme "catppuccin"
    end 
}

return M
