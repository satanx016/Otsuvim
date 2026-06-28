return {
    {
        'nvim-mini/mini.ai',
        event = "LazyFile",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        opts = function()
            local ai = require("mini.ai")
            return {
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({ a = { "@conditional.outer" }, i = { "@conditional.inner" } }), -- code block
                    a = ai.gen_spec.treesitter({ a = { "@parameter.outer" }, i = { "@parameter.inner" } }), -- argument
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
                    d = { "%f[%d]%d+" }, -- digits
                    g = { from = { line = 1, col = 1 }, to = { line = vim.fn.line("$"), col = math.max(vim.fn.getline("$"):len(), 1) }} -- entire file
                },
                silent = true,
            }
        end,
        config = function(_, opts)
            require("mini.ai").setup(opts)
            Util.mini.ai_whichkey(opts)
        end,
    },
}
