---@type OtsurcConfig
local M = {}

M.ui = {
	theme = "tokyonight",
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

if vim.g.neovide then
	M.ui.transparency = false
end

return M
