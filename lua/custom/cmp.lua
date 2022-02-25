local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

local status_ok, lspkind = pcall(require, "lspkind")
if not status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Utility function from docs for Super-Tab like mappings
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end
  },
  mapping = {
    -- Try using Ctrl+N and Ctrl+P instead
    -- ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- ["<C-j>"] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- disable Nvim's default Ctrl-Y mapping which is probably this :help Ctrl-Y
    -- don't know since picked up from docs
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(), c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` the first one.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }),


    -- Super-Tab like mapping
    -- i.e. move to completion points in a snippet
    -- Taken from `nvim-cmp`'s wiki

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  formatting = {
    fields = {"kind", "abbr", "menu"},
    format = lspkind.cmp_format {
      mode = "symbol",
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      },
    }
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },

  -- Not Documented
  -- See -> https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/cmp.lua
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },

  -- experimental = { ghost_text = true }
}
