vim.loader.enable()
vim.g.base46_cache = vim.fn.stdpath("data") .. "/otsu/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = vim.g.mapleader

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

require("options")

-- load plugins
require("lazy").setup({
	{ import = "otsu.plugins" },
	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("otsu.autocmds")

vim.schedule(function()
	require("mappings")
end)

if vim.g.neovide then
	require("configs.neovide")
end
