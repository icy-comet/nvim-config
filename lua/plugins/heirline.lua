local M = {
    "rebelot/heirline.nvim",

    dependencies = {
        "catppuccin/nvim",
        "neovim/nvim-lspconfig",
    },

    config = function()
        local heirline = require("heirline")
        local statusline = require("custom/statusline")
        local tabline = require("custom/tabline")
        local colors = require("catppuccin.palettes").get_palette "mocha"

        heirline.load_colors(colors)
        heirline.setup({
            statusline=statusline,
            tabline=tabline
        })
    end
}

return M
