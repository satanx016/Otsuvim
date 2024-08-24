local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(client, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = desc }
	end

	map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Lsp Go to type definition"))
	map("n", "gD", vim.lsp.buf.declaration, opts("Lsp Go to declaration"))
	map("n", "gd", vim.lsp.buf.definition, opts("Lsp Go to definition"))
	map("n", "gr", vim.lsp.buf.references, opts("Lsp Go to references"))
	map("n", "gi", vim.lsp.buf.implementation, opts("Lsp Go to implementation"))

	map("n", "K", vim.lsp.buf.hover, opts("Lsp hover information"))
	map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Lsp Show signature help"))

	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Lsp Add workspace folder"))
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Lsp Remove workspace folder"))
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("Lsp List workspace folders"))

	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Lsp Code action"))
	map("n", "<leader>cr", vim.lsp.buf.rename, opts("Lsp Rename"))

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
						vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
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
