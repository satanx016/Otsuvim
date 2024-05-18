vim.cmd[[hi clear]] -- Fixing default colors

-- Default Theme
require('colorschemes.tokyonight')

-- Fixing Bufferline Separators on transparent
if not vim.g.neovide then
    vim.cmd[[highlight BufferLineSeparator guifg=#131313]]
    vim.cmd[[highlight BufferLineSeparatorSelected guifg=#131313]]
    vim.cmd[[highlight BufferLineSeparatorVisible guifg=#131313]]
    vim.cmd[[highlight BufferLineTabSeparator guifg=#000e1c]]
    vim.cmd[[highlight BufferLineTabSeparatorSelected guifg=#000e1c]]
end
