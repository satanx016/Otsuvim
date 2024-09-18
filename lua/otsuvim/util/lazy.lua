local M = {}

M.setup = function()
	M.lazy_file()
end

M.lazy_file = function()
	local Event = require("lazy.core.handler.event")

	Event.mappings.LazyFile = { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
	Event.mappings["User LazyFile"] = Event.mappings.LazyFile
end

return M
