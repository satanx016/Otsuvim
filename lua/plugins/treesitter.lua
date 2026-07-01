return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    event = { "LazyFile" },
    build = ":TSUpdate",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("custom_treesitter_highlighting", { clear = true }),
        callback = function(e)
          pcall(vim.treesitter.start, e.buf)
        end,
      })
    end,
  },

  {
    "nvim-mini/mini.ai",
    event = "LazyFile",
    opts = function()
      local ai = require("mini.ai")
      return {
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@conditional.outer", "@loop.outer" },
            i = { "@conditional.inner", "@loop.inner" },
          }), -- code block
          a = ai.gen_spec.treesitter({ a = { "@parameter.outer" }, i = { "@parameter.inner" } }), -- argument
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
          d = { "%f[%d]%d+" }, -- digits
          g = {
            from = { line = 1, col = 1 },
            to = { line = vim.fn.line("$"), col = math.max(vim.fn.getline("$"):len(), 1) },
          }, -- entire file -- FIX: not working properly
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
