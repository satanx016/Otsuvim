return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "selene" } },
  },

  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = {
      linters_by_ft = {
        fish = { "fish" },
        lua = { "selene" },
      },
    },
    config = function(_, opts)
      require("lint").linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
