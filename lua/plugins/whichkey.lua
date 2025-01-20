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

        wk.add({
            { "<leader>b",  group = "Buffer" },
            { "<leader>f",  group = "Find" },
            { "<leader>h",  group = "Git" },
            { "<leader>ht", group = "Toggle" },
            { "<leader>j",  group = "Harpoon" },
            { "<leader>p",  group = "Format" },
            { "<leader>w",  group = "Window" },
            { "<leader>x",  group = "Diagnostics" },
        })
    end
}

return M
