vim.loader.enable() -- experimental loader features (supposed to be faster)
vim.g.based_cache = vim.fn.stdpath("data") .. "/otsuui/based/"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("otsuvim.config.options")
--- neovide ---
if vim.g.neovide then
	require("otsuvim.config.neovide")
end

local lazy_config = require("otsuvim.config.lazy")

require("lazy").setup({
	{ import = "otsuvim.plugins" },
	{ import = "otsuvim.plugins.extras.vanity" },
	-- { import = "otsuvim.plugins.test" },
}, lazy_config)

-- load theme ---
dofile(vim.g.based_cache .. "defaults")
dofile(vim.g.based_cache .. "statusline")

require("otsuvim.config.autocmds")

vim.schedule(function()
	require("otsuvim.config.keymaps")
end)
