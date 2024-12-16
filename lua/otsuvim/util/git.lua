local M = {}

local path = require("plenary.path")
local job = require("plenary.job")

local function git(args, cwd)
  local output
  ---@diagnostic disable-next-line: missing-fields
  local p = job:new({
    command = "git",
    args = args,
    cwd = cwd or M.get_git_root(),
  })
  p:after_success(function(j)
    output = j:result()
  end)
  p:sync()
  return output or {}
end

function M.get_git_root()
  return git({ "rev-parse", "--show-toplevel" }, tostring(path:new(vim.api.nvim_buf_get_name(0)):parent()))[1]
end

function M.git_browse(opts)
  local remote_url = git({ "remote", "get-url", git({ "remote" })[1] })[1]
  local branch = git({ "rev-parse", "--abbrev-ref", "HEAD" })[1]
  local file = git({ "ls-files", "--full-name", vim.api.nvim_buf_get_name(0) })[1]
  local url

  if file then
    local ln_num

    if vim.fn.mode():find("[vV]") then
      vim.fn.feedkeys(":", "nx")
      ln_num = "#L" .. vim.api.nvim_buf_get_mark(0, "<")[1] .. "-L" .. vim.api.nvim_buf_get_mark(0, ">")[1]
    else
      ln_num = "#L" .. vim.fn.line(".")
    end

    url = remote_url:gsub("%.git$", "") .. "/blob/" .. branch .. "/" .. file .. ln_num
  else
    url = remote_url:gsub("%.git$", "") .. "/tree/" .. branch
  end

  if opts.open then
    Otsuvim.notify.info(remote_url:match("https://(.*)"), { icon = "󰊢", title = "Opening...", timeout = 4300 })
    vim.ui.open(url)
  else
    vim.fn.setreg("+", url)
  end
end

return M
