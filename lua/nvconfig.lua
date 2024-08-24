local M = {}

M.ui = {
	------------------------------- based -------------------------------------
	-- hl = highlights
	hl_add = {},
	hl_override = {},
	changed_themes = {},
	theme = "poimandres", -- default theme
	transparency = false,

	cmp = {
		icons = true,
		lspkind_text = true,
		style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
	},

	telescope = { style = "borderless" }, -- borderless / bordered

	------------------------------- otsuui modules -----------------------------
	statusline = {
		theme = "default", -- default/vscode/minimal
		-- default/round/block/arrow separators work only for default otsuline theme
		-- round and block will work for minimal theme only
		separator_style = "default",
		order = nil,
		modules = nil,
	},

	-- lazyload it when there are 1+ buffers
	tabufline = {
		enabled = true,
		lazyload = true,
		order = { "treeOffset", "buffers", "tabs" },
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
			"      ░                                   002",
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
}

M.based = {
	integrations = {},
}

M.utils = {
	-- define project roots
	projects = {
		"~/projects",
		"~/projects/*",
		"~/projects/test/*",

		"~/dotfiles",
		"~/dotfiles/*",
		"~/.config/*",

		"~/notes",
	},
}

return M
