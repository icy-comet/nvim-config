-- see :help map-modes
-- see :help map-silent

-- considering that `g` is mapped to `h` and `h` is mapped to `b` in the vim config,
-- then in recursive mapping, pressing `g` indirectly gets mapped/expanded to `b`
-- and in non-recursive mapping, `g` gets mapped/expaned to `h` and stops there

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- shorten the function name
local k = vim.api.nvim_set_keymap

-- Remap the Space key as the leader key
k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "




-- NOTES
  -- Modes
    -- normal_mode = "n",
    -- insert_mode = "i",
    -- visual_mode = "v",
    -- visual_block_mode = "x",
    -- term_mode = "t",
    -- command_mode = "c",
  -- Keys -> see `:help keycodes`
    -- S - Shift
    -- C - Ctrl
    -- A - Alt
    -- <cmd> - :
    -- <CR> - Enter




-- Better window navigation
k("n", "<C-h>", "<C-w>h", opts) -- move to window to the left
k("n", "<C-j>", "<C-w>j", opts) -- move to window below
k("n", "<C-k>", "<C-w>k", opts) -- move to window above
k("n", "<C-l>", "<C-w>l", opts) -- move to window to the right. doesn't work if netrw is open
k("n", "<C-f>", "<C-w>c", opts) -- close active window


-- Resize a window with arrows
k("n", "<C-Up>", ":resize -2<CR>", opts)
k("n", "<C-Down>", ":resize +2<CR>", opts)
k("n", "<C-Left>", ":vertical resize -2<CR>", opts)
k("n", "<C-Right>", ":vertical resize +2<CR>", opts)


-- Navigate buffers (vim native)
k("n", "<S-l>", ":bnext<CR>", opts)
k("n", "<S-h>", ":bprevious<CR>", opts)


-- BarBar mappings
k("n", "<Leader>c", "<cmd>BufferClose<CR>", opts)
k("n", "<S-Tab>", "<cmd>BufferNext<CR>", opts)


-- NvimTree mappings
k("n", "<Leader>e", "<cmd>ModNvimTreeFindFileToggle<CR>", opts)

