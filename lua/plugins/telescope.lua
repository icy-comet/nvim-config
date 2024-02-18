local M = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", function() builtin.find_files({hidden = true, no_ignore = true}) end, { desc = "Find Files"})
        vim.keymap.set("n", "<leader>fw", builtin.live_grep, {desc = "Find Words/Text"})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = "Find Buffers"})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {desc = "Find Help"})
    end
}

return M
