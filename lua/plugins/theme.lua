-- FIX: Should opt for my owm themes `based` (needs a rewrite)
return {
	{
		"zenbones-theme/zenbones.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.zenbones_compat = 1
			vim.cmd.colorscheme("zenbones")
		end,
	},
}
