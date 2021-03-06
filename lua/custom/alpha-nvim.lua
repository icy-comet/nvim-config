local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
local btn = dashboard.button

-- Set header
dashboard.section.header.val = {

 "██╗ ██████╗██╗   ██╗     ██████╗ ██████╗ ███╗   ███╗███████╗████████╗",
 "██║██╔════╝╚██╗ ██╔╝    ██╔════╝██╔═══██╗████╗ ████║██╔════╝╚══██╔══╝",
 "██║██║      ╚████╔╝     ██║     ██║   ██║██╔████╔██║█████╗     ██║   ",
 "██║██║       ╚██╔╝      ██║     ██║   ██║██║╚██╔╝██║██╔══╝     ██║   ",
 "██║╚██████╗   ██║       ╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗   ██║   ",
 "╚═╝ ╚═════╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝   ╚═╝   ",

}

local open_cfg_cmd = "<cmd>lua require('nvim-tree').open(vim.call('stdpath', \z
                      'config'))<CR>"

dashboard.section.buttons.val = {
  -- see :help map-cmd
  -- see https://www.lua.org/manual/5.3/manual.html#:~:text=%5Cu%7BXXX%7D
  -- to know about embedding utf-8 encoded hex character in a string
  btn("SPC o c", "\u{fb44}  Open Config", open_cfg_cmd),
}

alpha.setup(dashboard.config)
