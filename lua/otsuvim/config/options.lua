local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = " "
g.maplocalleader = vim.g.mapleader
g.autoformat = true -- Otsuvim auto format

o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus" -- Synchronize with system clipboard
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- opt.sidescrolloff = 999 -- horizontal centering
opt.scrolloff = 999 -- vertitcal
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.cmdheight = 0
o.ignorecase = true
o.smartcase = true
opt.mouse = ""

-- Numbers
opt.relativenumber = true
o.number = true
o.numberwidth = 2
o.ruler = false
o.wrap = false


opt.shortmess:append("sI") -- disable nvim intro

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 300
o.undofile = true

opt.smoothscroll = true
opt.foldexpr = "v:lua.require'otsuui.otsucolumn'.foldexpr()"
opt.foldmethod = "expr"
opt.foldtext = ""
opt.foldlevel = 99

o.swapfile = false

opt.whichwrap:append("<>[]hl") -- switch to previous/next line when cursor reaches end/beginning of line

vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. ":" .. vim.env.PATH

if vim.g.neovide then
	require("otsuvim.config.neovide")
end
