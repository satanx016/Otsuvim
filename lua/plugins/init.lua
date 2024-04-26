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

	-- These are some examples, uncomment them if you want to see them work!
	-- {
	--   "neovim/nvim-lspconfig",
	--   config = function()
	--     require("otsu.configs.lspconfig").defaults()
	--     require "configs.lspconfig"
	--   end,
	-- },
	--
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"lua-language-server", "stylua",
	-- 			"html-lsp", "css-lsp" , "prettier"
	-- 		},
	-- 	},
	-- },
	--
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"vim", "lua", "vimdoc",
	--      "html", "css"
	-- 		},
	-- 	},
	-- },
}
