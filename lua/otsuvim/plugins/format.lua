return {
	{
		"stevearc/conform.nvim",
		event = "LazyFile",
		opts = function()
			return {
				-- Conform will run multiple formatters sequentially / Use a sub-list to run only the first available formatter
				formatters_by_ft = {
					lua = { "stylua" },
					-- python = { "isort", "black" },
					-- javascript = { { "prettierd", "prettier" } },
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
