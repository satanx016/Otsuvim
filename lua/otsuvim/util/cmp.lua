local M = {}

local luasnip = package.loaded["luasnip"]

function M.is_visible()
	local cmp = package.loaded["cmp"]
	return cmp and cmp.core.view:visible()
end

function M.select_next()
	local cmp = package.loaded["cmp"]
	return function(fallback)
		if M.is_visible() then
			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		else
			fallback()
		end
	end, { "i", "s" }
end

function M.select_prev()
	local cmp = package.loaded["cmp"]
	return function(fallback)
		if M.is_visible() then
			cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }
end

function M.get_formatting_style()
	local cmp_ui = require("nvconfig").ui.cmp
	local icons = require("otsu-ui.icons.lspkind")

	return {
		format = function(_, item)
			local icon = (cmp_ui.icons and icons[item.kind]) or ""

			icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
			item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")

			return item
		end,
	}
end

-- util func anti-redundance lol
function M.get_border(hl)
	return {
		{ "╭", hl },
		{ "─", hl },
		{ "╮", hl },
		{ "│", hl },
		{ "╯", hl },
		{ "─", hl },
		{ "╰", hl },
		{ "│", hl },
	}
end

return M
