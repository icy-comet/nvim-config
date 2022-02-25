local options = {
  backup = false,                       -- do not create a backup file
  swapfile = false,                     -- do not create a swap file
  clipboard = "unnamedplus",            -- copy to system clipboard
  expandtab = true,                     -- convert tab to spaces
  shiftwidth = 2,                       -- number of spaces inserted for each indentation
  tabstop = 2,                          -- number of spaces for a tab
  number = true,                        -- show line numbers
  relativenumber = true,                -- show relative line numbers to the active line
  showtabline = 2,                      -- show tab page labels
  cmdheight = 2,                        -- number of lines for command-line
  conceallevel = 0,                     -- unhide backticks in MD and quotes in JSON
  splitbelow = true,                    -- force horizontal splits to open below the current window
  splitright = true,                    -- force vertical splits to open to the right of the current window
  undofile = true,                      -- enable persisten undo (see :help undo-persistence)
  cursorline = true,                    -- highlight the working line
  ignorecase = true,                    -- ignore case in search patterns
  smartcase = true,                     -- drop ignorecase if search pattern contains uppercase letters
  mouse = "a",                          -- allow mouse use in all modes
  scrolloff = 8,                        -- keep 8 lines above the cursor when scrolling 
  signcolumn = "yes",                   -- always show the sign column (where diagnostic signs are shown)
  wrap = false,                         -- forces to properly format code
  completeopt = {"menu", "menuone", "noselect"}    -- related to nvim-cmp
}

for k,v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "colorscheme catppuccin"

-- treat words with hyphens between them as a single word
vim.cmd "set iskeyword+=-"

-- avoid :ins-completion-menu msgs
vim.opt.shortmess:append "c"
