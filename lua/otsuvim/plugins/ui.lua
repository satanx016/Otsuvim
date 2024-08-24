return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return { override = require("otsuvim.config.icons.devicons") }
		end,
		config = function(_, opts)
			dofile(vim.g.based_cache .. "devicons")
			require("nvim-web-devicons").setup(opts)
		end,
	},

	{
		dir = "~/projects/based",
		build = function()
			require("based").load_all_highlights()
		end,
	},

	{
		dir = "~/projects/otsuui/",
		lazy = false,
		config = function()
			require("otsuui")
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = function()
			return {
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},

				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			}
		end,
		config = function(_, opts)
			require("noice").setup(opts)
			require("notify").setup({
				fps = 60,
				top_down = false,
				render = "wrapped-compact",
				background_colour = "#000000",
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User FilePost",
		opts = function()
			return {
				indent = { char = "│", highlight = "IblChar" },
				scope = { char = "│", highlight = "IblScopeChar" },
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"dashboard",
						"lazy",
						"mason",
						"notify",
					},
				},
			}
		end,
		config = function(_, opts)
			dofile(vim.g.based_cache .. "blankline")

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
			require("ibl").setup(opts)

			dofile(vim.g.based_cache .. "blankline")
		end,
	},

	{
		"stevearc/dressing.nvim",
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "V", "g" },
		cmd = "WhichKey",
		config = function(_, opts)
			dofile(vim.g.based_cache .. "whichkey")
			require("which-key").setup(opts)
		end,
	},
}
