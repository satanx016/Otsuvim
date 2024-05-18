if not vim.g.neovide then
    require('tokyonight').setup({
        transparent = vim.g.transparent_enabled,
        styles = {
            sidebars = 'transparent',
            floats = 'transparent'
        },
        -- Temporary fix for the term color
        -- I should start working on the auto color palette project
        io.popen('! wal -i Pictures/Wallpapers/Goth/deathPrincess_SoulReaping.png'),
    })
end
vim.cmd('colorscheme tokyonight')
