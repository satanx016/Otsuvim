local M = {}

function M.toggle_preview_focus(prompt_bufnr)
  local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  local previewer = picker.previewer
  local bufnr = previewer.state.bufnr
  -- stylua: ignore start
  vim.keymap.set("n", "<C-l>", function() vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", picker.prompt_win)) end, { buffer = bufnr })
  vim.keymap.set("n", "<C-h>", function() vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", picker.prompt_win)) end, { buffer = bufnr })
  -- stylua: ignore end
  vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", previewer.state.winid))
end

return M
