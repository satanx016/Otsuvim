local M = {}

M.setup = function()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.uv.fs_stat(lazypath) then
		local repo = "https://github.com/folke/lazy.nvim.git"
		vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
	end
	vim.opt.rtp:prepend(lazypath)

	M.lazy_file()

	local lazy_config = require("otsuvim.config.lazy")
	require("lazy").setup({
		{ import = "otsuvim.plugins" },
		{ import = "otsuvim.plugins.extras.vanity" },
	}, lazy_config)
end

M.lazy_file = function()
	local Event = require("lazy.core.handler.event")

	Event.mappings.LazyFile = { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
	Event.mappings["User LazyFile"] = Event.mappings.LazyFile
end

return M
