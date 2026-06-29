local M = {}

function M.ai_whichkey()
  local textobjects = {
    -- builtin
    { "(", desc = "() block" },
    { ")", desc = "() block with ws" },
    { "{", desc = "{} block" },
    { "}", desc = "{} with ws" },
    { "b", desc = ")]} block" },
    { "q", desc = "quote `\"'" },
    { "?", desc = "user prompt" },

    { " ", desc = "whitespace" },
    { "_", desc = "underscore" },

    -- custom
    { "g", desc = "entire file" },
    { "o", desc = "block, conditional, loop" },
    { "a", desc = "argument" },
    { "f", desc = "function" },
    { "c", desc = "class" },
    { "d", desc = "digit(s)" },
    { "d", desc = "digit(s)" },
  }

  local mappings = {
    around = "a",
    inside = "i",
    around_next = "an",
    inside_next = "in",
    around_last = "al",
    inside_last = "il",
  }

  local spec = { mode = { "o", "x" } }

  for name, prefix in pairs(mappings) do
    spec[#spec + 1] = { prefix, group = name }

    for _, obj in pairs(textobjects) do
      spec[#spec + 1] = { prefix .. obj[1], desc = obj.desc }
    end
  end

  require("which-key").add(spec)
end

return M
