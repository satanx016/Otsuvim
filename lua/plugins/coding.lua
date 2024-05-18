return {
    -- mini auto-pairs
    {
        "echasnovski/mini.pairs",
        config = function()
            require('mini.pairs').setup({
                modes = { insert = true, command = true, terminal = false },
            })
        end,
    }
}
