-- Plugins are added and tested here, might be merged in otsu

return {
	{
		"coffebar/neovim-project",
		cmd = "NeovimProjectLoadRecent",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
			{ "Shatur/neovim-session-manager" },
		},
		opts = function()
			return require("configs.neovim-project")
		end,
		config = function(_, opts)
			require("neovim-project").setup(opts)
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
			return require("configs.noice")
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

	-- Open Neovim help in vertical split if there is enough space
	{
		"anuvyklack/help-vsplit.nvim",
		event = "VeryLazy",
		config = function()
			require("help-vsplit").setup({
				always = true,
				side = "right",
				buftype = { "help" },
				filetype = { "man" },
			})
		end,
	},

	-- Diff and merging tool for git
	{
		"NeogitOrg/neogit",
		cmd = { "Neogit" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("neogit").setup()
		end,
	},

	-- rich presence
	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		config = function()
			require("configs.neocord")
		end,
	},

	-- Neorg
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim", "nvim-treesitter" },
		event = "VeryLazy",
		version = "*", -- Pin Neorg to the latest stable release
		opts = function()
			require("configs.neorg")
		end,
		config = function(_, opts)
			require("neorg").setup(opts)
		end,
	},
}
