return {
	{
		"IogaMaster/neocord",
		enabled = false,
		event = "VeryLazy",
		opts = function()
			local images = {
				vimmers_be_like = "https://media.tenor.com/2c7diqh1oVIAAAAC/anime-computer.gif",
				all_I_think_is_code = "https://64.media.tumblr.com/3266909503ce1b116b12d749cdf79bd2/f88eb9d10119c5f2-0f/s1280x1920/b58f793f41b65bec13387a0496c8c05c59a52b06.gif",
				coding_sharingan = "https://64.media.tumblr.com/ba8c705edd2bed0a28d9458811155d69/tumblr_onxkyoloha1w05w8zo1_500.gif",
				helltaker_malina_coding = "https://art.ngfiles.com/images/2214000/2214330_dicecoffeedox_helltaker-gamer-malina.gif?f1638277110",
			}

			return {
				logo = images.helltaker_malina_coding,
				logo_tooltip = "Yet Another Vimmer",
				main_image = "logo",
				client_id = "1157438221865717891",
				log_level = nil,
				debounce_timeout = 10,
				show_time = true,
				global_timer = true,
				-- enable_line_number = 1,

				workspace_text = "Working on %s",
				editing_text = "Adding bugs to %s",
				reading_text = "Staring at %s",
				file_explorer_text = "Browsing %s",
				git_commit_text = "Committing changes",
				plugin_manager_text = "⌬ Managing plugins",
				line_number_text = "Line %s out of %s",
				terminal_text = "Using Terminal",
			}
		end,
	},
}
