-- Plugins are added and tested here, might be merged in otsu
return {
	{
		"Shatur/neovim-session-manager",
		event = "VeryLazy",
		config = function(_, opts)
			require("session_manager").setup(opts)
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
			require("notify").setup({
				fps = 60,
				top_down = false,
				render = "wrapped-compact",
                background_colour = "#000000",
			})
		end,
	},
}
