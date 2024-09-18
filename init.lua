vim.g.based_cache = vim.fn.stdpath("data") .. "/otsuui/based/"
_G.Otsuvim = require("otsuvim.util")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("otsuvim.config.options")

local lazy_config = require("otsuvim.config.lazy")
require("lazy").setup({
	{ import = "otsuvim.plugins" },
	{ import = "otsuvim.plugins.extras.vanity" },
	-- { import = "otsuvim.plugins.test" },
}, lazy_config)

dofile(vim.g.based_cache .. "defaults")
dofile(vim.g.based_cache .. "statusline")

require("otsuvim.config.autocmds")

vim.schedule(function()
	require("otsuvim.config.keymaps")
end)
