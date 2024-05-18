return {
    {
        'rcarriga/nvim-notify',
        config = function()
            require('notify').setup({
                render = 'minimal',
                fps = 60,
                top_down = false,
            })
            vim.notify = require('notify')
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       -- add a border to hover docs and signature help
                },
            })
        end,
    },
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        config = function()
            require('hlchunk').setup({
                blank = {
                    enable = false,
                }
            })
        end
    },
    {
        'mawkler/modicator.nvim',
        dependencies = 'nyoom-engineering/oxocarbon.nvim', -- Add your colorscheme plugin here
        config = function()
            require('modicator').setup({
                show_warnings = false,
            })
        end,
    },
    {
        'norcalli/nvim-colorizer.lua',
    },
}
