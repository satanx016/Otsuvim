-- Plugins are added and tested here, might be merged in otsu
return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = function()
			require("configs.persistence")
		end,
		config = function(_, opts)
			require("persistence").setup(opts)
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
			require("configs.noice")
		end,
		config = function(_, opts)
			require("noice").setup(opts)
		end,
	},
}
