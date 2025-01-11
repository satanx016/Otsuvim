return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "biome" } },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        css = { "biomejs" },
        javascript = { "biomejs" },
        javascriptreact = { "biomejs" },
        json = { "biomejs" },
        jsonc = { "biomejs" },
        typescript = { "biomejs" },
        typescriptreact = { "biomejs" },
      },
    },
  },
}
