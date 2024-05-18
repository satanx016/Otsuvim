-- LazyVim Setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- Environemnt setup

local lazy_config = require 'configs.lazy'

-- load plugins
require('lazy').setup({
	{
		import = 'plugins',
    config = function ()
      require 'options'
    end
	},
}, lazy_config)

-- load lsp
require('plugins.lsp.init')

-- load theme
require('colorschemes.colorscheme')

vim.schedule(function()
	require('configs.keymaps')
end)
