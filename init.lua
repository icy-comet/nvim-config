-- see :help lua-vimscript

-- needs to be very first to load
-- avoid error with pcall on first-time setup
pcall(require, "impatient")
require "custom/options"
require "custom/keymaps"
require "custom/commands"
require "custom/plugins"
require "custom/cmp"

-- [] ensure catppuccin integrations
