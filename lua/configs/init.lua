-- Options & Keymaps
require 'config.options'
require 'config.keymaps'

-- Setup Neovide 
if vim.g.neovide then
    require 'config.neovide'
end
