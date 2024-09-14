return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
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
				auto_install = true,

				highlight = {
					enable = true,
					use_languagetree = true,
				},

				indent = { enable = true },
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
