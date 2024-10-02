vim.g.based_cache = vim.fn.stdpath("data") .. "/otsu-ui/based/"

require("otsuvim.config.options")

_G.Otsuvim = require("otsuvim.util")
Otsuvim.config = require("otsuvim.config.otsurc")

Otsuvim.lazy.setup()

dofile(vim.g.based_cache .. "defaults")
dofile(vim.g.based_cache .. "statusline")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("otsuvim.config.keymaps")
		require("otsuvim.config.autocmds")
	end,
})
