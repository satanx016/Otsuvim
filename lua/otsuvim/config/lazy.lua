local M = {}

M.setup = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
  end
  vim.opt.rtp:prepend(lazypath)

  -- LazyFile event
  local Event = require("lazy.core.handler.event")
  Event.mappings.LazyFile = { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
  Event.mappings["User LazyFile"] = Event.mappings.LazyFile

  require("lazy").setup({
    { import = "otsuvim.plugins" },
    { import = "otsuvim.plugins.extras.vanity.neocord" },
    { import = "otsuvim.plugins.extras.util.fcitx" },
  }, {
    defaults = { lazy = true },
    install = { colorscheme = { "otsu" } },

    ui = {
      icons = {
        lazy = "💤 ",
        loaded = "󰚌",
        not_loaded = "󰯈 ",
      },
    },

    performance = {
      rtp = {
        -- disable some rtp plugins for faster startup / increased overall performance
        disabled_plugins = {
          "2html_plugin",
          "tohtml",
          "getscript",
          "getscriptPlugin",
          "gzip",
          "logipat",
          "netrw",
          "netrwPlugin",
          "netrwSettings",
          "netrwFileHandlers",
          "matchit",
          "tar",
          "tarPlugin",
          "rrhelper",
          "spellfile_plugin",
          "vimball",
          "vimballPlugin",
          "zip",
          "zipPlugin",
          "tutor",
          "rplugin",
          "syntax",
          "synmenu",
          "optwin",
          "compiler",
          "bugreport",
          "ftplugin",
        },
      },
    },
  })
end

return M
