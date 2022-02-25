local status_ok, ll = pcall(require, "lualine")
if not status_ok then
  return
end

ll.setup {
  options = {
    -- theme = "catppuccin",
    disabled_filetypes = {"NvimTree"}
  }
}

