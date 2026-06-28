return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
        }
    },

    {
        'saghen/blink.cmp',
        event = "InsertEnter",
        dependencies = {
            'saghen/blink.lib',
        },
        build = function()
            require('blink.cmp').build():pwait()
        end,
        opts = {
            keymap = {
                ['<c-x>'] = {'accept', 'fallback'},
            },
            sources = {
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },
        },
    },

    {
        "echasnovski/mini.surround",
        event = "LazyFile",
        opts = {
            mappings = {
                add = "gsa",
                delete = "gsd",
                find = "gsf",
                find_left = "gsF",
                highlight = "gsh",
                replace = "gsr",
            },
        },
    },

    {
        "nvim-mini/mini.pairs",
        event = "VeryLazy",
        opts = {},
    },
}
