local autocmd = vim.api.nvim_create_autocmd

-- Help/Man Veritcal split
autocmd("BufWinEnter", {
	pattern = { "*.txt", "*(*)" },
	callback = function()
		if vim.bo.filetype == "help" or vim.bo.filetype == "man" then
			vim.cmd("wincmd L")
		end
	end,
})

-- Highlight yanked text for 150ms
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

if vim.version().minor >= 10 then
	autocmd("LspProgress", {
		callback = function(args)
			if string.find(args.match, "end") then
				vim.cmd("redrawstatus")
			end
			vim.cmd("redrawstatus")
		end,
	})
end

-- reload some nvconfig options on-save
autocmd("BufWritePost", {
	pattern = vim.tbl_map(function(path)
		return vim.fs.normalize(vim.uv.fs_realpath(path) or path)
	end, vim.fn.glob(vim.fn.stdpath("config") .. "/lua/**/*.lua", true, true, true)),
	group = vim.api.nvim_create_augroup("ReloadOtsu", {}),

	callback = function(opts)
		local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
		local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
		local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

		require("plenary.reload").reload_module("nvconfig")
		require("plenary.reload").reload_module("based")
		require("plenary.reload").reload_module(module)

		local config = require("nvconfig")

		-- otsuline
		require("plenary.reload").reload_module("otsu-ui.otsuline.utils")
		require("plenary.reload").reload_module("otsu-ui.otsuline." .. config.ui.statusline.theme)
		vim.opt.statusline = "%!v:lua.require('otsu-ui.otsuline." .. config.ui.statusline.theme .. "')()"

		-- otsutab
		if config.ui.tabufline.enabled then
			require("plenary.reload").reload_module("otsu-ui.otsutab.modules")
			vim.opt.tabline = "%!v:lua.require('otsu-ui.otsutab.modules')()"
		end

		require("based").load_all_highlights()
		-- vim.cmd("redraw!")
	end,
})
