local M = {}

function M.setup(buffer)
	local function map(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
	end

	local ts = require("telescope.builtin")

	map("n", "<leader>cl", "<cmd>LspInfo<cr>", "Lsp Info")
	map("n", "gy", ts.lsp_type_definitions, "Goto T[y]pe definition")
	map("n", "gD", vim.lsp.buf.declaration, "Goto [D]eclaration")
	map("n", "gd", ts.lsp_definitions, "Goto [d]efinition")
	map("n", "gr", ts.lsp_references, "Goto [r]eferences")
	map("n", "gI", ts.lsp_implementations, "Goto [I]mplementation")
	map("n", "gs", ts.lsp_document_symbols, "Goto Document [s]ymbols")
	map("n", "gk", vim.lsp.buf.signature_help, "Signature Help")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
	map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
	map("n", "<leader>cc", vim.lsp.codelens.run, "Codelens Run")
	map("n", "<leader>cC", vim.lsp.codelens.refresh, "Codelens Refresh")
	map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
end

return M
