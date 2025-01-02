local M = {}

function M.setup(keys, buffer)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
  end

  local ts = require("telescope.builtin")

  -- defaults
  map("n", "<leader>cl", "<cmd>LspInfo<cr>", "Lsp info")
  map("n", "gy", ts.lsp_type_definitions, "Goto t[y]pe definition")
  map("n", "gD", vim.lsp.buf.declaration, "Goto [D]eclaration")
  map("n", "gd", ts.lsp_definitions, "Goto [d]efinition")
  map("n", "gr", ts.lsp_references, "Goto [r]eferences")
  map("n", "gI", ts.lsp_implementations, "Goto [I]mplementation")
  map("n", "<leader>ss", ts.lsp_document_symbols, "Goto document [s]ymbols")
  map("n", "gk", vim.lsp.buf.signature_help, "Signature help")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
  map("n", "<leader>cc", vim.lsp.codelens.run, "Codelens run")
  map("n", "<leader>cC", vim.lsp.codelens.refresh, "Codelens refresh")
  map("n", "<leader>cd", vim.diagnostic.open_float, "Line diagnostics")

  -- client specific keys
  if not keys then
    return
  end

  for _, key in pairs(keys) do
    map(key.mode or "n", key[1], key[2], key.desc)
  end
end

return M
