local fn = vim.fn

-- Bootstrap packer on first invoke
-- Taken from packer.nvim's readme
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1',
                                 'https://github.com/wbthomason/packer.nvim',
                                  install_path })
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call to handle first invoke
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Use a vim autocommand to hot-reload compiled loader file
-- BufWritePost triggers only with :w and not :wq on the `plugins.lua` file
-- Taken from packer.nvim's readme 
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return packer.startup({
  function(use)

    -- Base Plugins
    use "lewis6991/impatient.nvim"
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim" -- used by telescope.nvim and gitsigns.nvim

    
    -- Color Schemes & UI

    use "catppuccin/nvim"
 


    -- LSP & Diagnostics    

    -- use "neovim/nvim-lspconfig"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate", -- see :help packer-plugin-hooks
      config = function () require("custom/treesitter") end
    }

    use {
      "numToStr/Comment.nvim",
      config = function () require("custom/comment") end
    }


    -- Completion
    use "rafamadriz/friendly-snippets"

    use {
      "L3MON4D3/LuaSnip",
      config = function() require("luasnip.loaders.from_vscode").load() end
    }


    -- Functionality
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
      "nvim-lualine/lualine.nvim",
      config = function () require("custom/lualine") end
    }

    use {
      "goolord/alpha-nvim",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function () require "custom/alpha-nvim" end
    }

    use {
      "rcarriga/nvim-notify",
      config = function () vim.notify = require("notify") end
    }
    
    use {
      "norcalli/nvim-colorizer.lua", opt = true,
      cmd = {
        "ColorizerAttachToBuffer",
        "ColorizerReloadAllBuffers",
        "ColorizerToggle"
      }
    }

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function () require "custom/nvim-tree" end
    }

    -- Sync packer on first setup
    -- Needs to be the end of plugin declarations
    if packer_bootstrap then
      packer.sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float { border="rounded" }
      end
    }
  }})
