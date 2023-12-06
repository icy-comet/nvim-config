return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true
        -- empty setup using defaults
        require("nvim-tree").setup()
        vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
        vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { silent = true })
        -- required to hide a black strip on first open with custom statusline
        -- was faced by siduck as well
        -- see https://github.com/nvim-tree/nvim-tree.lua/issues/424
        vim.cmd "highlight NvimTreeStatusLineNC guibg=nvim_treebg guifg=nvim_treebg"
    end,
}
