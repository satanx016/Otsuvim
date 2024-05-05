local options = {
	disable_netrw = true,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	diagnostics = {
		enable = true,
	},
	renderer = {
		root_folder_label = false,
		highlight_git = true,

		indent_markers = {
			enable = true,
		},
	},
}

options.on_attach = function(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "<C-[>", api.tree.change_root_to_parent, opts("CD"))
end

local config = require("nvconfig").ui.nvimtree

if config.float then
	local HEIGHT_RATIO = 0.8
	local WIDTH_RATIO = 0.2
	options.view = {
		float = {
			enable = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = math.floor(screen_w * WIDTH_RATIO + 10)
				local window_h = math.floor(screen_h * HEIGHT_RATIO)
				return {
					border = "rounded",
					relative = "editor",
					row = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get(),
					col = (screen_w - window_w) / 2,
					width = window_w,
					height = window_h,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.lines:get() * WIDTH_RATIO)
		end,
	}
else
	options.view = {
		adaptive_size = false,
		side = "left",
		width = 30,
		preserve_window_proportions = true,
	}
end

return options
