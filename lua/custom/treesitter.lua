local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

ts.setup {
  ensure_installed = "maintained",
  
  -- install parsers synchronously
  sync_install = false,
  
  ignore_install = {},

  highlight = {
    enable = true, -- `false` will disable entire plugin
    disable = {} -- list of languages to disable
  },

  indent = {
    -- experimental feature as of 2022.02.23
    enable = true,
    disable = {}
  },

  -- External module
  -- nvim-ts-context-comment preferred opts
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
