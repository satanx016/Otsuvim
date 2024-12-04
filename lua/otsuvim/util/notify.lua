local M = {}

function M.info(msg, opts)
  vim.notify(vim.print(msg), vim.log.levels.INFO, opts)
end

function M.warn(msg, opts)
  vim.notify(vim.print(msg), vim.log.levels.WARN, opts)
end

return M
