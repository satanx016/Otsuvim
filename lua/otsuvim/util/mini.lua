local M = {}

function M.ai_gen_spec_buffer()
  local from = { line = 1, col = 1 }
  local to = {
    line = vim.fn.line("$"),
    col = math.max(vim.fn.getline("$"):len(), 1),
  }
  return { from = from, to = to }
end

return M
