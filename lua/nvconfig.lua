local M = {}

M.ui = {
	------------------------------- base46 -------------------------------------
	-- hl = highlights
	hl_add = {},
	hl_override = {},
	changed_themes = {},
	theme_toggle = { "onedark", "one_light" },
	theme = "gruvbox", -- default theme
	transparency = true,

	cmp = {
		icons = true,
		lspkind_text = true,
		style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
	},

	telescope = { style = "borderless" }, -- borderless / bordered

	------------------------------- otsu_ui modules -----------------------------
	statusline = {
		theme = "default", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "default",
		order = nil,
		modules = nil,
	},

	-- lazyload it when there are 1+ buffers
	tabufline = {
		enabled = true,
		lazyload = true,
		order = { --[[ "treeOffset", ]]
			"buffers",
			"tabs",
			"btns",
		},
		modules = nil,
	},

	nvdash = {
		load_on_startup = true,

		header = {
			" ▒█████     ▄▄▄█████▓     ██████    ▓█    ██ ",
			"▒██▒  ██▒   ▓  ██▒ ▓▒   ▒██▒   ▒   ▒███  ▓██▒",
			"▒██░  ██▒   ▒ ▓██░ ▒░   ░ ▓██▄     ░▓██  ▒██░",
			"▒██   ██░   ░ ▓██▓ ░      ▒  ▒██▒   ▓██  ░██░",
			"░ ████▓▒░     ▒██▒ ░    ▒██████▒▒   ▒▓█████▓ ",
			"░ ▒░▒░▒░      ▒ ░░      ▒ ▒▓▒ ▒ ░   ░▒▓▒░▒ ▒ ",
			"  ░ ▒ ▒░        ░       ░ ░▒  ░      ░▒░ ░ ░ ",
			"░   ░ ▒                    ░          ░  ░   ",
			"      ░        ░           ░                 ",
			"               ░                      ░      ",
			"      ░                                  x016",
		},

		buttons = {
			{ "󰉋  Recent Project", "Spc p r", "Telescope neovim-project discover" },
			{ "󰈚  Recent Files", "Spc f r", "Telescope oldfiles" },
			{ "  Themes", "Spc o t", "Telescope themes" },
			{ "  Mappings", "Spc c h", "Cheatsheet" },
			{ "󰒲  Lazy", "Spc L", "Lazy" },
		},
	},

	cheatsheet = { theme = "grid" }, -- simple/grid

	lsp = { signature = true },

	term = {
		hl = "Normal:term,WinSeparator:WinSeparator",
		sizes = { sp = 0.3, vsp = 0.2 },
		float = {
			relative = "editor",
			row = 0.3,
			col = 0.25,
			width = 0.5,
			height = 0.4,
			border = "single",
		},
	},

	nvimtree = {
		float = true,
	},
}

M.base46 = {
	integrations = {},
}

------------------------------- neovide -------------------------------------
vim.g.neovide_transparency = M.ui.transparency and 0.8 or 1

return vim.tbl_deep_extend("force", M, require("otsurc"))
