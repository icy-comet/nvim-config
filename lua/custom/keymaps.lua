-- see :help map-modes see :help map-silent

-- considering that `g` is mapped to `h` and `h` is mapped to `b` in the vim config,
-- then in recursive mapping, pressing `g` indirectly gets mapped/expanded to `b`
-- and in non-recursive mapping, `g` gets mapped/expaned to `h` and stops there

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- shorten the function name
local k = vim.keymap.set

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
    -- <ESC> - Escape

-- Better Window Navigation
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

k("n", "<C-s>", ":write<CR>", {silent = true, noremap = true, desc = "Write Buffer"})
k("n", "<leader>bs", ":write<CR>", {silent = true, noremap = true, desc = "Write Buffer"})
k("n", "<leader>bw", ":write<CR>", {silent = true, noremap = true, desc = "Write Buffer"})
k("n", "<leader>bc", ":bdelete<CR>", {silent = true, noremap = true, desc = "Close Buffer"})
k("n", "<leader>bk", ":bdelete!<CR>", {silent = true, noremap = true, desc = "Kill Buffer"})
k("n", "<leader>bn", ":bnext<CR>", {silent = true, noremap = true, desc = "Next Buffer"})
k("n", "<leader>bp", ":bprev<CR>", {silent = true, noremap = true, desc = "Prev Buffer"})
k("n", "<Tab>", ":bnext<CR>", {silent = true, noremap = true, desc = "Next Buffer"})
-- seems to affect speed, if done with plain strings
k("n", "<leader>wc", function() vim.cmd "quit" end, {silent = true, noremap = true, desc = "Close Window"})
k("n", "<leader>wk", function() vim.cmd "quit!" end, {silent = true, noremap = true, desc = "Kill Window"})

k("n", "<ESC>", ":nohl<CR>", {silent = true, noremap = true, desc = "Clear Highlights"})
