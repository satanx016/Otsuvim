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
				projects = Otsuvim.config.utils.projects,
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

	{
		"nvim-neorg/neorg",
		ft = "norg",
		version = "*",
		keys = { { "<leader>n", "<cmd>Neorg<CR>", desc = "Neorg" } },
		opts = function()
			vim.wo.conceallevel = 2

			return {
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/notes",
							},
							default_workspace = "notes",
						},
					},
					["core.summary"] = {},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
				},
			}
		end,
	},
}
