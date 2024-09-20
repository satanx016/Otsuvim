local M = {}

M.on_attach = function(client, bufnr)
	local function map(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { desc = desc })
		return { buffer = bufnr, desc = desc }
	end

	map("n", "<leader>cl", "<cmd>LspInfo<cr>", "Lsp Info")
	map("n", "gy", vim.lsp.buf.type_definition, "Goto T[y]pe definition")
	map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
	map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
	map("n", "gr", vim.lsp.buf.references, "Goto References")
	map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
	map("n", "K", vim.lsp.buf.hover, "Hover")
	map("n", "gk", vim.lsp.buf.signature_help, "Signature Help")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
	map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
	map("n", "<leader>cc", vim.lsp.codelens.run, "Codelens Run")
	map("n", "<leader>cC", vim.lsp.codelens.refresh, "Codelens Refresh")
	map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")

	-- setup signature popup
	if client.server_capabilities.signatureHelpProvider then
		require("otsuvim.plugins.lsp.signature").setup(client, bufnr)
	end
end

-- disable semanticTokens
M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

M.defaults = function()
	dofile(vim.g.based_cache .. "lsp")
	require("otsuvim.plugins.lsp")

	require("lspconfig").lua_ls.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		on_init = M.on_init,

		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
						vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
						"${3rd}/luv/library",
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
			},
		},
	})
end

return M
