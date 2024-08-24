return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			return {
				hijack_cursor = true,
				sync_root_with_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true,
				},
				modified = {
					enable = true,
				},
				diagnostics = {
					enable = true,
					show_on_dirs = true,
					severity = {
						-- min = vim.diagnostic.severity.ERROR,
					},
				},
				renderer = {
					root_folder_label = false,
					highlight_git = true,

					indent_markers = {
						enable = true,
					},
				},
			}
		end,
		config = function(_, opts)
			dofile(vim.g.based_cache .. "nvimtree")
			require("nvim-tree").setup(opts)
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		cmd = "Telescope",
		opts = function()
			return {
				defaults = {
					vimgrep_arguments = {
						"rg",
						"-L",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					prompt_prefix = "   ",
					selection_caret = "󰥓  ",
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						width = 0.87,
						height = 0.80,
					},

					mappings = {
						n = { ["q"] = require("telescope.actions").close },
					},
					file_ignore_patterns = {
						"%.git/",
						"node_modules/",
            "%.mp3$",
						"%.ogg$",
						"%.m4a$",
						"%.opus$",
            "%.webp$",
            "%.jpg$",
            "%.jpeg$",
						"%.png$",
						"%.gif$",
						"%.mp4$",
						"%.gz$",
						"%.zip$",
					},
				},
			}
		end,
		config = function(_, opts)
			dofile(vim.g.based_cache .. "telescope")
			require("telescope").setup(opts)
		end,
	},
}