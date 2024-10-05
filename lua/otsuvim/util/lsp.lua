local M = {}

function M.setup(opts)
	M.on_attach(M.check_cache_methods)

	-- document_highlight
	if opts.document_highlight.enabled then
		M.on_supports_method("textDocument/documentHighlight", function(_, buf)
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "CursorMoved", "CursorMovedI" }, {
				buffer = buf,
				group = vim.api.nvim_create_augroup("Otsuvim_lsp_word_" .. buf, { clear = true }),
				callback = function()
					if not Otsuvim.cmp.is_visible() then
						vim.lsp.buf.document_highlight()
					end
				end,
			})
		end)

		-- clear before highlighting to fix the flickery effect
		local handler = vim.lsp.handlers["textDocument/documentHighlight"]
		vim.lsp.handlers["textDocument/documentHighlight"] = function(err, result, ctx, config)
			if not vim.api.nvim_buf_is_loaded(ctx.bufnr) then
				return
			end
			vim.lsp.buf.clear_references()
			return handler(err, result, ctx, config)
		end
	end

	-- inlay hints
	if opts.inlay_hints.enabled then
		M.on_supports_method("textDocument/inlayHint", function(_, buf)
			vim.lsp.inlay_hint.enable(true, { bufnr = buf })
		end)
	end

	-- code lens
	if opts.codelens.enabled and vim.lsp.codelens then
		M.on_supports_method("textDocument/codeLens", function(_, buf)
			vim.lsp.codelens.refresh()
			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
				buffer = buf,
				callback = vim.lsp.codelens.refresh,
			})
		end)
	end

	M.on_supports_method("textDocument/semanticTokens/full", function(client, _)
		client.server_capabilities.semanticTokensProvider = nil
	end)
end

function M.on_attach(on_attach, name)
	return vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client and (not name or client.name == name) then
				return on_attach(client, buffer)
			end
		end,
	})
end

-- cached table for supported methods
M._supports_method = {}

function M.on_supports_method(method, fn)
	M._supports_method[method] = M._supports_method[method] or setmetatable({}, { __mode = "k" })
	return vim.api.nvim_create_autocmd("User", {
		pattern = "LspSupportsMethod",
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			local buffer = args.data.buffer
			if client and method == args.data.method then
				return fn(client, buffer)
			end
		end,
	})
end

function M.check_cache_methods(client, buffer)
	-- don't trigger on invalid buffers
	if not vim.api.nvim_buf_is_valid(buffer) then
		return
	end
	-- don't trigger on non-listed buffers
	if not vim.bo[buffer].buflisted then
		return
	end
	-- don't trigger on nofile buffers
	if vim.bo[buffer].buftype == "nofile" then
		return
	end
	for method, clients in pairs(M._supports_method) do
		clients[client] = clients[client] or {}
		if not clients[client][buffer] then
			if client.supports_method and client.supports_method(method, { bufnr = buffer }) then
				clients[client][buffer] = true
				vim.api.nvim_exec_autocmds("User", {
					pattern = "LspSupportsMethod",
					data = { client_id = client.id, buffer = buffer, method = method },
				})
			end
		end
	end
end

return M
