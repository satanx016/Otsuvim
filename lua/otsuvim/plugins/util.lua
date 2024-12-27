return {
  { "nvim-lua/plenary.nvim" },

  {
    "coffebar/neovim-project",
    dependencies = { "Shatur/neovim-session-manager" },
    cmd = { "NeovimProjectDiscover", "NeovimProjectHistory", "NeovimProjectLoadRecent" },
    keys = {
      { "<leader>pf", "<cmd>NeovimProjectDiscover<CR>", desc = "List all" },
      { "<leader>pr", "<cmd>NeovimProjectHistory<CR>", desc = "List recent" },
      { "<leader>pl", "<cmd>NeovimProjectLoadRecent<CR>", desc = "Restore last" },
    },
    opts = function()
      vim.opt.sessionoptions:remove("folds")

      return {
        projects = {
          "~/projects",
          "~/projects/*",

          "~/dotfiles",
          "~/dotfiles/*",
          "~/.config/*",

          "~/notes",
        },
        last_session_on_startup = false,
      }
    end,
  },

  {
    "catgoose/nvim-colorizer.lua",
    event = "LazyFile",
    keys = { { "<leader>uh", "<Cmd>ColorizerToggle<CR>", desc = "Toggle Highlight Colors" } },
    keys = { { "<leader>uh", "<Cmd>ColorizerToggle<CR>", desc = "Toggle highlight colors" } },
    opts = function()
      return { user_default_options = { names = false } }
    end,
  },

  {
    "nvim-neorg/neorg",
    version = "*",
    dependencies = { "satanx016/neorg-colorizer" },
    cmd = "Neorg",
    ft = "norg",
    keys = {
      { "<leader>nn", "<cmd>Neorg<CR>", desc = "Neorg" },
      { "<leader>ni", "<cmd>Neorg index<CR>", desc = "Index" },
      { "<leader>nr", "<cmd>Neorg return<CR>", desc = "Return" },
      { "<leader>nc", "<Plug>(neorg.dirman.new-note)", desc = "Create note" },
    },
    opts = function()
      dofile(vim.g.based_cache .. "neorg")
      vim.wo.conceallevel = 2

      return {
        load = {
          ["core.defaults"] = {},
          ["core.summary"] = {},
          ["core.concealer"] = { config = { icon_preset = "diamond" } },
          ["core.dirman"] = {
            config = {
              workspaces = { notes = "~/notes" },
              default_workspace = "notes",
            },
          },
          ["core.completion"] = { config = { engine = "nvim-cmp" } },
          ["core.highlights"] = {
            config = { highlights = { todo_items = { on_hold = "+@neorg.todo_items.on_hold.norg" } } },
          },

          ["external.neorg-colorizer"] = {},
        },
      }
    end,
  },
}
