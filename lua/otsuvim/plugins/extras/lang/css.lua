return {

  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "prettier" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {
          filetypes = { "css", "less" },
        },
        somesass_ls = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.scss = opts.formatters_by_ft.scss or {}
      table.insert(opts.formatters_by_ft.scss, "prettier")
    end,
  },
}
