return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<C-space>", desc = "Increment Selection", mode = { "x", "n" } },
        { "<A-space>", desc = "Decrement Selection", mode = "x" },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    event = { "LazyFile", "User TelescopePreviewerLoaded" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return {
        highlight = { enable = true },
        ensure_installed = {
          "lua",
          "luadoc",
          "printf",
          "regex",
          "vim",
          "vimdoc",
        },
        auto_install = true,
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<A-space>",
          },
        },
      }
    end,
    config = function(_, opts)
      pcall(function()
        dofile(vim.g.based_cache .. "syntax")
        dofile(vim.g.based_cache .. "treesitter")
      end)
      require("nvim-treesitter.configs").setup(opts)

      vim.filetype.add({
        pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
      })
    end,
  },

  {
    "echasnovski/mini.ai",
    event = "LazyFile",
    opts = function()
      local ai = require("mini.ai")

      return {
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }), -- code block

          ["="] = ai.gen_spec.treesitter({ a = { "@assignment.rhs" }, i = { "@assignment.rhs" } }), -- assignment
          a = ai.gen_spec.argument({ brackets = { "%b()" }, separator = ";" }), -- argument
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
          d = { "%f[%d]%d+" }, -- digits
          g = Otsuvim.mini.gen_spec_buffer(),
          e = { -- snake/camel case
            { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
            "^().*()$",
          },
        },
        n_lines = 150,
      }
    end,
  },
}
