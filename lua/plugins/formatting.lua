return {
    {
        'stevearc/conform.nvim',
        event = "LazyFile",
        keys = {
            { "<leader>cf", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "Format" },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" }
            }
        },
    }
}
