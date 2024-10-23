local M = {}

setmetatable(M, {
  __index = function(t, k)
    t[k] = require("otsuvim.util." .. k)
    return t[k]
  end,
})

function M.info(msg, opts)
  vim.notify(msg, vim.log.levels.INFO, opts)
end

function M.warn(msg, opts)
  vim.notify(msg, vim.log.levels.WARN, opts)
end

return M
