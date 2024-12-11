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
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["al"] = { query = "@loop.outer", desc = "loop" },
              ["il"] = { query = "@loop.inner", desc = "inner loop" },
              ["ab"] = { query = "@block.outer", desc = "block" },
              ["ib"] = { query = "@block.inner", desc = "inner block" },
              ["af"] = { query = "@function.outer", desc = "function" },
              ["if"] = { query = "@function.inner", desc = "inner function" },
              ["ac"] = { query = "@conditional.outer", desc = "condition" },
              ["ic"] = { query = "@conditional.inner", desc = "inner condition" },
              ["ap"] = { query = "@parameter.outer", desc = "parameter" },
              ["ip"] = { query = "@parameter.inner", desc = "inner parameter" },
              ["av"] = { query = "@assignment.lhs", desc = "variable" },
              ["aa"] = { query = "@assignment.rhs", desc = "assignment" },
              ["a/"] = { query = "@comment.outer", desc = "comment" },
              ["i/"] = { query = "@comment.inner", desc = "inner comment" },
            },
          },
          move = {
            enable = true,
            goto_next_start = {
              ["]f"] = { query = "@function.outer", desc = "Next function start" },
              ["]c"] = { query = "@conditional.outer", desc = "Next condition start" },
              ["]p"] = { query = "@parameter.inner", desc = "Next parameter start" },
              ["]v"] = { query = "@assignment.lhs", desc = "Next variable start" },
              ["]a"] = { query = "@assignment.rhs", desc = "Next assignment start" },
            },
            goto_next_end = {
              ["]F"] = { query = "@function.outer", desc = "Next function end" },
              ["]C"] = { query = "@conditional.outer", desc = "Next condition end" },
              ["]P"] = { query = "@parameter.inner", desc = "Next parameter end" },
              ["]V"] = { query = "@assignment.lhs", desc = "Next variable end" },
              ["]A"] = { query = "@assignment.rhs", desc = "Next assignment end" },
            },
            goto_previous_start = {
              ["[f"] = { query = "@function.outer", desc = "Previous function start" },
              ["[c"] = { query = "@conditional.outer", desc = "Previous condition start" },
              ["[p"] = { query = "@parameter.inner", desc = "Previous parameter start" },
              ["[v"] = { query = "@assignment.lhs", desc = "Previous variable start" },
              ["[a"] = { query = "@assignment.rhs", desc = "Previous assignment start" },
            },
            goto_previous_end = {
              ["[F"] = { query = "@function.outer", desc = "Previous function end" },
              ["[C"] = { query = "@conditional.outer", desc = "Previous condition end" },
              ["[P"] = { query = "@parameter.inner", desc = "Previous parameter end" },
              ["[V"] = { query = "@assignment.lhs", desc = "Previous variable end" },
              ["[A"] = { query = "@assignment.rhs", desc = "Previous assignment end" },
            },
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
}
