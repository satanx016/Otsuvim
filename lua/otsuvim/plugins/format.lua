return {
  {
    "stevearc/conform.nvim",
    event = "LazyFile",
    opts = function()
      return {
        formatters_by_ft = {
          lua = { "stylua" },
          sh = { "shfmt" },
        },

        format_on_save = function()
          return vim.g.autoformat and {
            timeout_ms = 500,
            lsp_fallback = true,
          } or nil
        end,
      }
    end,
  },
}
