local M = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local wk = require("which-key")
        wk.setup()

        wk.register({
            j = {name = "Harpoon"},
            b = {name = "Buffer"},
            f = {name = "Find"},
            h = {name = "Git"},
            ht = {name = "Toggle"},
            w = {name = "Window"},
            x = {name = "Diagnostics"},
            p = {name = "Format"}
        }, {prefix = "<leader>"})
    end
}

return M
