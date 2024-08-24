return {
	{
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		opts = function()
			return {
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "󰍵" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "│" },
				},
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
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("neogit").setup()
		end,
	},
}
