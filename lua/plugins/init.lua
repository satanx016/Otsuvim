-- Plugins are added and tested here, might be merged in otsu
return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = function ()
			require("configs.persistence")
        end,
		config = function(_, opts)
			require("persistence").setup(opts)
		end,
	},
}
