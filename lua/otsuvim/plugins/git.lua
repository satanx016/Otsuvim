return {
	{
		"lewis6991/gitsigns.nvim",
		event = "LazyFile",
		opts = function()
			dofile(vim.g.based_cache .. "git")

			return {
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "▎" },
					untracked = { text = "▎" },
				},
				signs_staged_enable = false,
			}
		end,
	},

	{
		"NeogitOrg/neogit",
		cmd = { "Neogit" },
		dependencies = {
			"sindrets/diffview.nvim",
		},
		opts = function()
			dofile(vim.g.based_cache .. "neogit")
			return {}
		end,
	},
}
