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
		keys = {
			{ "<leader>nn", "<cmd>Neorg<CR>", desc = "neorg" },
			{ "<leader>ni", "<cmd>Neorg index<CR>", desc = "index" },
			{ "<leader>nc", "<cmd>Neorg toggle-concealer<CR>", desc = "toggle concealer" },
			{ "<leader>nr", "<cmd>Neorg return<CR>", desc = "return" },
			{ "<localleader>nn", "<Plug>(neorg.dirman.new-note)", desc = "[neorg] Create New Note" },
		},
		opts = function()
			vim.wo.conceallevel = 2

			return {
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {
						config = {
							icon_preset = "diamond",
						},
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/notes",
							},
							default_workspace = "notes",
						},
					},
					["core.summary"] = {},
					["core.completion"] = { config = { engine = "nvim-cmp" } },
				},
			}
		end,
	},
}
