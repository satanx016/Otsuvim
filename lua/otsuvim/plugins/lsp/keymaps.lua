local M = {}

function M.setup(keys, buffer)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
  end

  local ts = require("telescope.builtin")

  M.keys = {
    { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp info" },
    { "gy", ts.lsp_type_definitions, desc = "Goto t[y]pe definition" },
    { "gD", vim.lsp.buf.declaration, desc = "Goto [D]eclaration" },
    { "gd", ts.lsp_definitions, desc = "Goto [d]efinition" },
    { "gr", ts.lsp_references, desc = "Goto [r]eferences" },
    { "gI", ts.lsp_implementations, desc = "Goto [I]mplementation" },
    { "<leader>ss", ts.lsp_document_symbols, desc = "Goto document [s]ymbols" },
    { "gk", vim.lsp.buf.signature_help, desc = "Signature help" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code action" },
    { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
    { "<leader>cc", vim.lsp.codelens.run, desc = "Codelens run" },
    { "<leader>cC", vim.lsp.codelens.refresh, desc = "Codelens refresh" },
    { "<leader>cd", vim.diagnostic.open_float, desc = "Line diagnostics" },
  }

  -- client specific keys
  if not keys then
    return
  end

  for _, key in pairs(M.keys) do
    vim.keymap.set(key.mode or "n", key[1], key[2], { buffer = buffer, desc = key.desc })
  end
end

return M
