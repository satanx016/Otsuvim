local M = {}

M.based = {
  integrations = {},
  changed_themes = {},
  theme = "catppuccin", -- default theme
  transparency = false,
  -- hl = highlights
  hl_add = {},
  hl_override = {},
}

M.ui = {
  term = {
    float = { width = 0.6, height = 0.55 },
    hsplit = { height = 0.3 },
    vsplit = { width = 0.3 },
  },

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  ------------------------------- otsu-ui modules -----------------------------
  statusline = {
    enabled = true,
    theme = "default", -- default/vscode/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = nil,
    modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs" },
    modules = nil,
  },

  dash = {
    enabled = true,
    load_on_startup = true,

    header = {
      " ▒█████     ▄▄▄█████▓     ██████    ▓█    ██ ",
      "▒██▒  ██▒   ▓  ██▒ ▓▒   ▒██▒   ▒   ▒███  ▓██▒",
      "▒██░  ██▒   ▒ ▓██░ ▒░   ░ ▓██▄     ░▓██  ▒██░",
      "▒██   ██░   ░ ▓██▓ ░      ▒  ▒██▒   ▓██  ░██░",
      "░ ████▓▒░     ▒██▒ ░    ▒██████▒▒   ▒▓█████▓ ",
      "░ ▒░▒░▒░      ▒ ░░      ▒ ▒▓▒ ▒ ░   ░▒▓▒░▒ ▒ ",
      "  ░ ▒ ▒░        ░       ░ ░▒  ░      ░▒░ ░ ░ ",
      "░   ░ ▒                    ░          ░  ░   ",
      "      ░        ░           ░                 ",
      "               ░                      ░      ",
      "      ░                                      ",
    },

    buttons = {
      { icon = " ", key = "f", txt = "Find File", action = "Telescope find_files" },
      { icon = " ", key = "r", txt = "Recent Files", action = "Telescope oldfiles" },
      { icon = "󰙅 ", key = "p", txt = "Find Project", action = "NeovimProjectDiscover" },
      { icon = " ", key = "n", txt = "Notes", action = "cd ~/notes | Neorg index" },
      { icon = "󰒓 ", key = "c", txt = "Config", action = "Telescope find_files cwd=" .. vim.fn.stdpath("config") },
      { icon = " ", key = "l", txt = "Last project", action = "NeovimProjectLoadRecent" },
      { icon = " ", key = "q", txt = "Quit", action = "qa!" },
    },
  },
}

return M
