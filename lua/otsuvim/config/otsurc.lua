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

  lsp = { signature = true },

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  ------------------------------- otsu-ui modules -----------------------------
  statusline = {
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

  otsudash = {
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
      "      ░                                   002",
    },

    buttons = {
      { "󰉋  Recent Project", "Spc p r", "Telescope neovim-project discover" },
      { "󰈚  Recent Files", "Spc f r", "Telescope oldfiles" },
      { "  Themes", "Spc o t", "Telescope themes" },
      { "  Mappings", "Spc c h", "Cheatsheet" },
      { "󰒲  Lazy", "Spc L", "Lazy" },
    },
  },
}

M.utils = {
  -- define project roots
  projects = {
    "~/projects",
    "~/projects/*",

    "~/dotfiles",
    "~/dotfiles/*",
    "~/.config/*",

    "~/notes",
  },
}

return M
