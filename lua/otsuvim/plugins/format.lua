return {
  {
    "stevearc/conform.nvim",
    event = "LazyFile",
    keys = {
      -- stylua: ignore
      { "<leader>cf", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "Format" },
    },
    opts = function()
      return {
        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
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
