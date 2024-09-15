return {
	defaults = { lazy = true },
	install = { colorscheme = { "otsu" } },

	rocks = { enabled = false },

	ui = {
		icons = {
			ft = "",
			lazy = "愛 ",
			loaded = "",
			not_loaded = "",
		},
	},

	performance = {
		rtp = {
			-- disable some rtp plugins for faster startup / increased overall performance
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
}
