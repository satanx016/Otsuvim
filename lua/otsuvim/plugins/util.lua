return {
	{ "nvim-lua/plenary.nvim" },

	{
		"coffebar/neovim-project",
		cmd = { "NeovimProjectDiscover", "NeovimProjectHistory", "NeovimProjectLoadRecent" },
		dependencies = {
			{ "Shatur/neovim-session-manager" },
		},
		opts = function()
      vim.opt.sessionoptions:remove("folds")

			return {
				projects = require("nvconfig").utils.projects,
				last_session_on_startup = false,
			}
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		event = "LazyFile",
		opts = function()
			return { user_default_options = { names = false } }
		end,
	},
}
