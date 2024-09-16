return {
	{
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		opts = function()
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
		config = function(_, opts)
			dofile(vim.g.based_cache .. "git")
			require("gitsigns").setup(opts)
		end,
	},

	{
		"NeogitOrg/neogit",
		cmd = { "Neogit" },
		dependencies = {
			"sindrets/diffview.nvim",
		},
		config = function()
      dofile(vim.g.based_cache .. "neogit")
			require("neogit").setup()
		end,
	},
}
