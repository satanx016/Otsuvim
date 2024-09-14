return {
	{ "nvim-lua/plenary.nvim" },

	{
		"coffebar/neovim-project",
		cmd = "NeovimProjectLoadRecent",
		dependencies = {
			{ "Shatur/neovim-session-manager" },
		},
		opts = function()
			local config = require("nvconfig")

			return {
				projects = config.utils.projects,

				last_session_on_startup = false,
				dashboard_mode = true,
			}
		end,
		config = function(_, opts)
			require("neovim-project").setup(opts)
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		event = "User FilePost",
		opts = function()
			return { user_default_options = { names = false } }
		end,
		config = function(_, opts)
			require("colorizer").setup(opts)
		end,
	},
}
