local M = {}

function M.ai_gen_spec_buffer()
  local from = { line = 1, col = 1 }
  local to = {
    line = vim.fn.line("$"),
    col = math.max(vim.fn.getline("$"):len(), 1),
  }
  return { from = from, to = to }
end

function M.ai_whichkey(opts)
  local objects = {
    { "(", desc = "() block" },
    { ")", desc = "() block with ws" },
    { "{", desc = "{} block" },
    { "}", desc = "{} with ws" },

    { " ", desc = "whitespace" },
    { "_", desc = "underscore" },
    { "q", desc = "quote `\"'" },
    { "d", desc = "digit(s)" },
    { "e", desc = "CaMel/sn_ake case" },

    { "=", desc = "assignment" },
    { "a", desc = "argument" },
    { "b", desc = ")]} block" },
    { "o", desc = "block, conditional, loop" },
    { "f", desc = "function" },
    { "c", desc = "class" },

    { "g", desc = "entire file" },
    { "?", desc = "user prompt" },
  }

  local spec = { mode = { "o", "x" } }
  local mappings = vim.tbl_extend("force", {
    around = "a",
    inside = "i",
    around_next = "an",
    inside_next = "in",
    around_last = "al",
    inside_last = "il",
  }, opts.mappings or {})

  for name, prefix in pairs(mappings) do
    name = name:gsub("^around_", ""):gsub("^inside_", "")
    spec[#spec + 1] = { prefix, group = name }
    for _, obj in ipairs(objects) do
      local desc = obj.desc
      if prefix:sub(1, 1) == "i" then
        desc = desc:gsub(" with ws", "")
      end
      spec[#spec + 1] = { prefix .. obj[1], desc = obj.desc }
    end
  end
  require("which-key").add(spec)
end

return M
