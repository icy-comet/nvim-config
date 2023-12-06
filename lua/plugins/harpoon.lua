local M = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>ja", function() harpoon:list():append() end, {desc = "Add Harpoon"})
        vim.keymap.set("n", "<leader>jl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "List Harpoons"})

        vim.keymap.set("n", "<leader>j1", function() harpoon:list():select(1) end, {desc = "Pull up 1"})
        vim.keymap.set("n", "<leader>j2", function() harpoon:list():select(2) end, {desc = "Pull up 2"})
        vim.keymap.set("n", "<leader>j3", function() harpoon:list():select(3) end, {desc = "Pull up 3"})
        vim.keymap.set("n", "<leader>j4", function() harpoon:list():select(5) end, {desc = "Pull up 4"})
    end,
}

return M
