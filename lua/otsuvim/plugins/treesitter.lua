return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "LazyFile", "User TelescopePreviewerLoaded" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		build = ":TSUpdate",
		keys = {
			{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
			{ "<bs>", desc = "Decrement Selection", mode = "x" },
		},
		opts = function()
			return {
				ensure_installed = {
					"lua",
					"luadoc",
					"printf",
					"regex",
					"vim",
					"vimdoc",
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<A-space>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = { query = "@function.outer", desc = "around function " },
							["if"] = { query = "@function.inner", desc = "inside function " },
							["ac"] = { query = "@class.outer", desc = "around class" },
							["ic"] = { query = "@class.inner", desc = "inside class" },
							["ak"] = { query = "@block.outer", desc = "around block" },
							["ik"] = { query = "@block.inner", desc = "inside block" },
							["aa"] = { query = "@parameter.outer", desc = "around argument" },
							["ia"] = { query = "@parameter.inner", desc = "inside argument" },
							["al"] = { query = "@loop.outer", desc = "around loop" },
							["il"] = { query = "@loop.inner", desc = "inside loop" },
						},
					},
					move = {
						enable = true,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
							["]a"] = "@parameter.inner",
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]C"] = "@class.outer",
							["]A"] = "@parameter.inner",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
							["[a"] = "@parameter.inner",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[C"] = "@class.outer",
							["[A"] = "@parameter.inner",
						},
					},
				},
			}
		end,
		config = function(_, opts)
			pcall(function()
				dofile(vim.g.based_cache .. "syntax")
				dofile(vim.g.based_cache .. "treesitter")
			end)
			require("nvim-treesitter.configs").setup(opts)

			vim.filetype.add({
				pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
			})
		end,
	},
}
