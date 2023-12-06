local M = {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
        require("mason").setup()
    end
}

return M
