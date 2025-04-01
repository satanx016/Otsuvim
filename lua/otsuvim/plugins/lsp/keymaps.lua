local M = {}

function M.setup(client, buffer)
  local ts = require("telescope.builtin")

  M.keys = {
    { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp info" },
    { "<leader>ss", ts.lsp_document_symbols, desc = "Goto document [s]ymbols" },
    { "gy", ts.lsp_type_definitions, desc = "Goto t[y]pe definition" },
    { "gD", vim.lsp.buf.declaration, desc = "Goto [D]eclaration", support = "declaration" },
    { "gd", ts.lsp_definitions, desc = "Goto [d]efinition", support = "definition" },
    { "grr", ts.lsp_references, desc = "[r]eferences" },
    { "gri", ts.lsp_implementations, desc = "Goto [I]mplementation" },
    { "gk", vim.lsp.buf.signature_help, desc = "Signature help", support = "signatureHelp" },
    { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", support = "rename" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code action", mode = { "n", "x" }, support = "codeAction" },
    { "<leader>cA", Otsuvim.lsp.action.source, desc = "Source actions", support = "codeAction" },
    { "<leader>cc", vim.lsp.codelens.run, desc = "Codelens run", support = "codeLens" },
    { "<leader>cC", vim.lsp.codelens.refresh, desc = "Codelens refresh", support = "codeLens" },
    { "<leader>cd", vim.diagnostic.open_float, desc = "Line diagnostics" },
  }

  vim.list_extend(M.keys, client.config.keys or {})

  for _, key in pairs(M.keys) do
    if not key.support or Otsuvim.lsp.supports_method(client, key.support) then
      vim.keymap.set(key.mode or "n", key[1], key[2], { buffer = buffer, desc = key.desc })
    end
  end
end

return M
