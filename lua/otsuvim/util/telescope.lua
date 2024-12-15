local M = {}

function M.toggle_preview_focus(prompt_bufnr)
  local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  local previewer = picker.previewer
  local bufnr = previewer.state.bufnr

  -- stylua: ignore start
  local function map(lhs, rhs) vim.keymap.set("n", lhs, rhs, {buffer = bufnr}) end

  map("q", function() require("telescope.actions").close(prompt_bufnr) end)
  map("<C-p>", function()  require("telescope.actions.layout").toggle_preview(prompt_bufnr) end)
  map("<C-h>", function() vim.cmd(("noautocmd lua vim.api.nvim_set_current_win(%s)"):format(picker.prompt_win)) end)
  map("<C-l>", function() vim.cmd(("noautocmd lua vim.api.nvim_set_current_win(%s)"):format(picker.prompt_win)) end)
  -- stylua: ignore end

  vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", previewer.state.winid))
end

return M
