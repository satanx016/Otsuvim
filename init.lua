-- Enable the experimental Lua module loader.
vim.loader.enable()

_G.Util = require("util")

require("config.options")
require("config.lazy")

vim.schedule(function()
  require("config.keymaps")
end)

-- Enable the new experimental command-line features.
require("vim._core.ui2").enable({})
