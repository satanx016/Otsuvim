local M = {}

function M.trace(msg, opts)
  vim.notify(vim.print(msg), vim.log.levels.TRACE, opts)
end

function M.debug(msg, opts)
  vim.notify(vim.print(msg), vim.log.levels.DEBUG, opts)
end

function M.warn(msg, opts)
  vim.notify(vim.print(msg), vim.log.levels.WARN, opts)
end

function M.info(msg, opts)
  vim.notify(vim.print(msg), vim.log.levels.INFO, opts)
end

function M.error(msg, opts)
  vim.notify(vim.print(msg), vim.log.levels.ERROR, opts)
end

return M
