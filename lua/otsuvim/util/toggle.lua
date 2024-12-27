local M = setmetatable({}, {
  __call = function(M, ...)
    return M.new(...)
  end,
})

local Toggle = {
  __call = function(Toggle)
    Toggle.opts.set(not Toggle.opts.get())
    local state = Toggle.opts.get()
    if state then
      Otsuvim.notify.info("Enabled " .. Toggle.opts.name, { title = Toggle.name })
    else
      Otsuvim.notify.warn("Disabled " .. Toggle.opts.name, { title = Toggle.name })
    end
    return state
  end,
}
Toggle.__index = Toggle

function M.new(opts)
  return setmetatable({ opts = opts }, Toggle)
end

function Toggle:map(key)
  vim.keymap.set("n", key, function()
    self()
  end)

  require("which-key").add({
    {
      key,
      icon = function()
        return self.opts.get() and { icon = " ", color = "green" } or { icon = " ", color = "yellow" }
      end,
      desc = function()
        return (self.opts.get() and "Disable " or "Enable ") .. self.opts.name
      end,
    },
  })
end

function M.option(option, opts)
  return M.new({
    name = opts.name or option,
    get = function()
      return vim.opt_local[option]:get()
    end,
    set = function(state)
      vim.opt_local[option] = state
    end,
  })
end

function M.format()
  return M.new({
    name = "auto format",
    get = function()
      return vim.g.autoformat == nil or vim.g.autoformat
    end,
    set = function(state)
      vim.g.autoformat = state
    end,
  })
end

function M.inlay_hints()
  return M.new({
    name = "inlay hints",
    get = function()
      return vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
    end,
    set = function(state)
      vim.lsp.inlay_hint.enable(state, { bufnr = 0 })
    end,
  })
end

function M.transparency()
  return M.new({
    name = "transparency",
    get = function()
      return Otsuvim.config.based.transparency
    end,
    set = function(state)
      Otsuvim.config.based.transparency = not Otsuvim.config.based.transparency
      require("based").load_all_highlights()
      require("otsu-ui.utils").replace_key_value(
        "transparency = " .. tostring(not state),
        "transparency = " .. tostring(state)
      )
    end,
  })
end

return M
