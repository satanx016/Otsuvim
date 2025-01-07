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

      local debounce = nil
      vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("nvim-lint", {}),
        callback = function()
          if debounce then
            vim.fn.timer_stop(debounce)
          end
          debounce = vim.fn.timer_start(
            200,
            vim.schedule(function()
              require("lint").try_lint()
            end)
          )
        end,
      })
    end,
  },
}
