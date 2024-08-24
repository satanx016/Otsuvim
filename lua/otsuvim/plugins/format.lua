return {
	{
		"stevearc/conform.nvim",
		opts = function()
			return {
				-- Conform will run multiple formatters sequentially / Use a sub-list to run only the first available formatter
				formatters_by_ft = {
					lua = { "stylua" },
					-- python = { "isort", "black" },
					-- javascript = { { "prettierd", "prettier" } },
				},

				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			}
		end,
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
}
