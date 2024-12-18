vim.g.based_cache = vim.fn.stdpath("data") .. "/otsu-ui/based/"

_G.Otsuvim = require("otsuvim.util")
Otsuvim.config = require("otsuvim.config.otsurc")

require("otsuvim.config.lazy").setup()

vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("otsuvim.config.options")
    require("otsuvim.config.keymaps")
  end,
})
