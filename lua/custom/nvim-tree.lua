local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

tree.setup {
  disable_netrw = true,     -- completely disable netrw
  hijack_cursor = true,     -- keep cursor on the first letter of the filename on navigation
}
