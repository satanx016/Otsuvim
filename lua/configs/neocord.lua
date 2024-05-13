local images = {
	vimmers_be_like = "https://media.tenor.com/2c7diqh1oVIAAAAC/anime-computer.gif",
	all_i_think_is_code = "https://64.media.tumblr.com/3266909503ce1b116b12d749cdf79bd2/f88eb9d10119c5f2-0f/s1280x1920/b58f793f41b65bec13387a0496c8c05c59a52b06.gif",
	coding_sharingan = "https://64.media.tumblr.com/ba8c705edd2bed0a28d9458811155d69/tumblr_onxkyoloha1w05w8zo1_500.gif",
	helltaker_malina_coding = "https://art.ngfiles.com/images/2214000/2214330_dicecoffeedox_helltaker-gamer-malina.gif?f1638277110",
}

local options = {
	-- General options
	logo = images.helltaker_malina_coding,
	logo_tooltip = "Yet Another Vimmer", -- nil or string
	main_image = "logo", -- "language" or "logo"
	neovim_image_text = "The One True Text Editor",
	client_id = "1157438221865717891", -- Use your own Discord application client id (not recommended)
	log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
	debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
	blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
	file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
	show_time = true, -- Show the timer
	global_timer = true, -- if set true, timer won't update when any event are triggered
	enable_line_number = true,

	-- Rich Presence text options
	editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
	file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
	git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
	plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
	reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
	workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
	line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
	terminal_text = "Using Terminal", -- Format string rendered when in terminal mode.
}

require("neocord").setup(options)
