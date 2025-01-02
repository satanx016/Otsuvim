local opt = vim.opt
local g = vim.g

g.autoformat = true -- Otsuvim auto format

opt.clipboard = "unnamedplus" -- Synchronize with system clipboard

opt.shortmess:append("sI") -- disable nvim intro
opt.scrolloff = 999 -- vertitcal
-- opt.sidescrolloff = 999 -- horizontal centering
opt.cursorline = true
opt.cursorlineopt = "number"
opt.whichwrap:append("<>[]hl") -- switch to previous/next line when cursor reaches end/beginning of line
opt.laststatus = 3
opt.cmdheight = 0
opt.splitbelow = true
opt.splitright = true

-- Indenting
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Search
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

-- Numbers
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.wrap = false

opt.timeoutlen = 100
opt.undofile = true
opt.swapfile = false

if vim.g.neovide then
  require("otsuvim.config.neovide")
end
