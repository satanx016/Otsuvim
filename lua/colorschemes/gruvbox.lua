require('gruvbox').setup({
    transparent_mode = vim.g.neovide and false or vim.g.transparent_enabled,
})
vim.cmd[[colorscheme gruvbox]]
