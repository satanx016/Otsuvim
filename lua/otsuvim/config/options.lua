local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = ","
g.autoformat = true -- Otsuvim auto format

opt.laststatus = 3
opt.showmode = false

opt.clipboard = "unnamedplus" -- Synchronize with system clipboard
opt.cursorline = true
opt.cursorlineopt = "number"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 0
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

-- opt.sidescrolloff = 999 -- horizontal centering
opt.scrolloff = 999 -- vertitcal
opt.cmdheight = 0
opt.ignorecase = true
opt.smartcase = true
opt.mouse = ""

-- Numbers
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.wrap = false

opt.shortmess:append("sI") -- disable nvim intro

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 300
opt.undofile = true

opt.smoothscroll = true

opt.swapfile = false

opt.whichwrap:append("<>[]hl") -- switch to previous/next line when cursor reaches end/beginning of line

if vim.g.neovide then
	require("otsuvim.config.neovide")
end
