local M = {}

setmetatable(M, {
  __index = function(_, k)
    return require("util." .. k)
  end,
})

return M
