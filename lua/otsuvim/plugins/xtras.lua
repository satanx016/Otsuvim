local config = Otsuvim.config.plugins.extras or {}
local extras = {}

for category, plugins in pairs(config) do
  for plugin, enabled in pairs(plugins) do
    if enabled then
      table.insert(extras, { import = "otsuvim.plugins.extras." .. category .. "." .. plugin })
    end
  end
end

return extras
