local M = {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.o.background = "dark"
        vim.g.gruvbox_material_transparent_background = 0
        vim.g.gruvbox_material_better_performance = 1
        vim.cmd("colorscheme gruvbox-material")
    end
}
return M
