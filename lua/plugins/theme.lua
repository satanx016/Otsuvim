-- FIX: Should opt for my owm themes `based` (needs a rewrite)
return {
	{
		"metalelf0/black-metal-theme-neovim",
		lazy = false,
		priority = 1000,
    opts = {
      theme = "darkthrone",
    },
    config = function(_, opts)
      require("black-metal").setup(opts)
      require("black-metal").load()
    end
	},
}
