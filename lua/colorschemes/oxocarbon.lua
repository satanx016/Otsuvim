function Oxocarbon()
    vim.o.background = 'dark'
    vim.cmd('colorscheme oxocarbon')

    -- Transparency
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

    -- Cursor color
    vim.cmd(':hi Cursor guifg=#555062 guibg=#FF7EB6')
    vim.cmd(':hi Cursor2 guifg=#555062 guibg=#FF7EB6')
    vim.cmd(':set guicursor=n-v-c:line-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50')
end

Oxocarbon()
