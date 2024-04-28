local lspconfig = require("lspconfig")
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = lspconfig.on_attach,
		on_init = lspconfig.on_init,
		capabilities = lspconfig.capabilities,
	})
end
