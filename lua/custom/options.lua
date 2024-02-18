local options = {
    backup = false, -- do not create a backup file
    swapfile = false, -- do not create a swap file
    clipboard = "unnamedplus", -- copy to system clipboard
    expandtab = true, -- convert tab to spaces
    shiftwidth = 4, -- number of spaces inserted for each indentation
    tabstop = 4, -- width of an actual tab character
    softtabstop = 4, -- make tabbing with spaces feel like a tab as whole
    number = true, -- show line numbers
    relativenumber = true, -- show relative line numbers to the active line
    showtabline = 2, -- show tab page labels
    conceallevel = 0, -- unhide backticks in MD and quotes in JSON
    splitbelow = true, -- force horizontal splits to open below the current window
    splitright = true, -- force vertical splits to open to the right of the current window
    undofile = true, -- enable persisten undo (see :help undo-persistence)
    ignorecase = true, -- ignore case in search patterns
    smartcase = true, -- drop ignorecase if search pattern contains uppercase letters
    mouse = "a", -- allow mouse use in all modes
    scrolloff = 8, -- keep 8 lines above the cursor when scrolling
    signcolumn = "yes", -- always show the sign column (where diagnostic signs are shown)
    wrap = false, -- forces to properly format code
    completeopt = { "menu", "menuone", "noselect" }, -- related to nvim-cmp
    fixeol = false, -- don't add extra line
    guicursor = "n-c-v:block-nCursor",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- treat words with hyphens between them as a single word
vim.cmd("set iskeyword+=-")

vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])

-- variable read-in by conform's config
vim.g.disable_autoformat = true

-- avoid :ins-completion-menu msgs
vim.opt.shortmess:append("c")

vim.diagnostic.config({ virtual_text = false })

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
