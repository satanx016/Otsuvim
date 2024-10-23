local M = {}

function M.wrap(toggle)
  return setmetatable(toggle, {
    __call = function()
      toggle.set(not toggle.get())
      local state = toggle.get()
      if state then
        Otsuvim.info("Enabled " .. toggle.name, { title = toggle.name })
      else
        Otsuvim.warn("Disabled " .. toggle.name, { title = toggle.name })
      end
      return state
    end,
  })
end

function M.option(option, opts)
  opts = opts or {}
  local name = opts.name or option
  return M.wrap({
    name = name,
    get = function()
      return vim.opt_local[option]:get()
    end,
    set = function(state)
      vim.opt_local[option] = state
    end,
  })
end

setmetatable(M, {
  __call = function(m, ...)
    return m.option(...)
  end,
})

function M.map(lhs, toggle)
  local t = M.wrap(toggle)
  vim.keymap.set("n", lhs, function()
    t()
  end)

  require("which-key").add({
    {
      lhs,
      icon = function()
        return toggle.get() and { icon = " ", color = "green" } or { icon = " ", color = "yellow" }
      end,
      desc = function()
        return (toggle.get() and "Disable " or "Enable ") .. toggle.name
      end,
    },
  })
end

function M.format()
  return M.wrap({
    name = "Auto Format",
    get = function()
      return vim.g.autoformat == nil or vim.g.autoformat
    end,
    set = function(state)
      vim.g.autoformat = state
    end,
  })
end

function M.inlay_hints()
  return M.wrap({
    name = "Inlay Hints",
    get = function()
      return vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
    end,
    set = function(state)
      vim.lsp.inlay_hint.enable(state, { bufnr = 0 })
    end,
  })
end

function M.transparency()
  return M.wrap({
    name = "Transparency",
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
