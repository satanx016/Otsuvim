local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = ","

-- opt.shortmess:append("I") -- disable nvim intro
opt.clipboard = "unnamedplus" -- Synchronize with system clipboard

opt.wrap = false
opt.scrolloff = 999 -- vertitcal cursor centering
opt.whichwrap:append("<>[]hl") -- switch to previous/next line when cursor reaches end/beginning of line
opt.laststatus = 3
opt.cmdheight = 0
opt.splitbelow = true
opt.splitright = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true

opt.relativenumber = true
opt.number = true

opt.swapfile = false
opt.timeoutlen = 100

-- opt.winborder = "rounded"

-- if vim.g.neovide then
-- require("neovide")
-- end

-- Add mason binaries to PATH manually since it's lazy-loaded
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
