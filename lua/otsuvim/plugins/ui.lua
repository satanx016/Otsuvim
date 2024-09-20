return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			dofile(vim.g.based_cache .. "devicons")
			return { override = require("otsu-ui.icons.devicons") }
		end,
	},

	{
		"satanx016/based",
		build = function()
			require("based").load_all_highlights()
		end,
	},

	{
		"satanx016/otsu-ui",
		event = "UIEnter",
		opts = {},
	},

	{
		"rcarriga/nvim-notify",
		opts = function()
			dofile(vim.g.based_cache .. "notify")

			return {
				fps = 60,
				top_down = false,
				max_height = function()
					return math.floor(vim.o.lines * 0.5)
				end,
				max_width = function()
					return math.floor(vim.o.columns * 0.6)
				end,
			}
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
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
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "LazyFile",
		opts = function()
			return {
				indent = { char = "│", highlight = "IblChar" },
				scope = { char = "│", highlight = "IblScopeChar" },
				exclude = {
					filetypes = {
						"help",
						"man",
						"lazy",
						"mason",
						"notify",
						"NvimTree",
						"NeogitStatus",
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
		event = "VeryLazy",
		opts = function()
			dofile(vim.g.based_cache .. "whichkey")

			return {
				preset = "modern",
				spec = {
					{
						mode = { "n", "v" },
						{ "<leader>c", group = "code" },
						{ "<leader>f", group = "file/find" },
						{ "<leader>s", group = "search" },
						{ "<leader>g", group = "git" },
						{ "<leader>gf", group = "find" },
						{ "<leader>gh", group = "hunk" },
						{ "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "azure" } },
						{ "<leader>p", group = "projects", icon = { icon = "󰉋 ", color = "blue" } },
						{ "<leader>L", icon = { icon = "󰒲", color = "azure" } },
						{ "<leader>cm", icon = { icon = "󱌢", color = "grey" } },
						{ "[", group = "prev" },
						{ "]", group = "next" },
						{ "g", group = "goto" },
						{ "z", group = "fold" },
						{
							"<leader>b",
							group = "buffer",
							expand = function()
								return require("which-key.extras").expand.buf()
							end,
						},
						{
							"<c-w>",
							group = "windows",
							expand = function()
								return require("which-key.extras").expand.win()
							end,
						},
					},
				},
				win = {
					no_overlap = false,
				},
			}
		end,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Keymaps (which-key)",
			},
		},
	},
}
