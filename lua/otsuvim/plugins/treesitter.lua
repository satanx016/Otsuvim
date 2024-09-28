return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "LazyFile", "User TelescopePreviewerLoaded" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
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
