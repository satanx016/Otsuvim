return {
  { "nvim-lua/plenary.nvim" },

  {
    "coffebar/neovim-project",
    dependencies = { "Shatur/neovim-session-manager" },
    cmd = { "NeovimProjectDiscover", "NeovimProjectHistory", "NeovimProjectLoadRecent" },
    keys = {
      { "<leader>pf", "<cmd>NeovimProjectDiscover<CR>", desc = "List All" },
      { "<leader>pr", "<cmd>NeovimProjectHistory<CR>", desc = "List Recent" },
      { "<leader>pl", "<cmd>NeovimProjectLoadRecent<CR>", desc = "Restore Last Project" },
    },
    opts = function()
      vim.opt.sessionoptions:remove("folds")

      return {
        projects = Otsuvim.config.utils.projects,
        last_session_on_startup = false,
      }
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "LazyFile",
    keys = { { "<leader>uh", "<Cmd>ColorizerToggle<CR>", desc = "Toggle Highlight Colors" } },
    opts = function()
      return { user_default_options = { names = false } }
    end,
  },

  {
    "nvim-neorg/neorg",
    version = "*",
    dependencies = { "satanx016/neorg-colorizer" },
    ft = "norg",
    keys = {
      { "<leader>nn", "<cmd>Neorg<CR>", desc = "neorg" },
      { "<leader>ni", "<cmd>Neorg index<CR>", desc = "index" },
      { "<leader>nr", "<cmd>Neorg return<CR>", desc = "return" },
      { "<leader>nc", "<Plug>(neorg.dirman.new-note)", desc = "Create New Note" },
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
