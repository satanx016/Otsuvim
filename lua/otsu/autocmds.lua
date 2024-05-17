local autocmd = vim.api.nvim_create_autocmd

-- folding settings for neorg buffers
autocmd("FileType", {
	pattern = "norg",
	callback = function()
		vim.opt.foldmethod = "marker"
		vim.wo.foldlevel = 99 -- Disable automatic folding
	end,
})

-- dont list quickfix buffers
autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})

-- reload highlights on startup
-- /!\ fixes wrong highlights when switching from neovide to nvim and vice versa
autocmd("UIEnter", {
	callback = function()
		require("base46").load_all_highlights()
	end,
})

-- reload some otsurc options on-save
autocmd("BufWritePost", {
	pattern = vim.tbl_map(function(path)
		return vim.fs.normalize(vim.loop.fs_realpath(path))
	end, vim.fn.glob(vim.fn.stdpath("config") .. "/lua/**/*.lua", true, true, true)),
	group = vim.api.nvim_create_augroup("ReloadOtsu", {}),

	callback = function(opts)
		local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
		local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
		local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

		require("plenary.reload").reload_module("nvconfig")
		require("plenary.reload").reload_module("otsurc")
		require("plenary.reload").reload_module("base46")
		require("plenary.reload").reload_module(module)

		--nvimtree
		require("plenary.reload").reload_module("otsu.configs.nvimtree")
		require("nvim-tree").setup(require("otsu.configs.nvimtree"))

		local config = require("nvconfig")

		-- statusline
		require("plenary.reload").reload_module("otsu.stl.utils")
		require("plenary.reload").reload_module("otsu.stl." .. config.ui.statusline.theme)
		vim.opt.statusline = "%!v:lua.require('otsu.stl." .. config.ui.statusline.theme .. "')()"

		-- tabufline
		if config.ui.tabufline.enabled then
			require("plenary.reload").reload_module("otsu.tabufline.modules")
			vim.opt.tabline = "%!v:lua.require('otsu.tabufline.modules')()"
		end

		require("base46").load_all_highlights()
		-- vim.cmd("redraw!")
	end,
})

-- user event that loads after UIEnter + only if file buf is there
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
	callback = function(args)
		local file = vim.api.nvim_buf_get_name(args.buf)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

		if not vim.g.ui_entered and args.event == "UIEnter" then
			vim.g.ui_entered = true
		end

		if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
			vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
			vim.api.nvim_del_augroup_by_name("NvFilePost")

			vim.schedule(function()
				vim.api.nvim_exec_autocmds("FileType", {})

				if vim.g.editorconfig then
					require("editorconfig").config(args.buf)
				end
			end)
		end
	end,
})
