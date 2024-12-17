return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = { { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer NvimTree" } },
    opts = function()
      dofile(vim.g.based_cache .. "nvimtree")

      return {
        hijack_cursor = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        modified = {
          enable = true,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          severity = {
            -- min = vim.diagnostic.severity.ERROR,
          },
        },
        renderer = {
          root_folder_label = false,
          highlight_git = true,

          indent_markers = {
            enable = true,
          },
        },
      }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    cmd = "Telescope",
    keys = {
      -- find
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
      -- stylua: ignore
      { "<leader>fa", "<cmd>Telescope find_files cwd=" .. vim.fs.joinpath(tostring(vim.fn.stdpath("data")), "lazy") .. "<CR>", desc = "All Files" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fc", "<cmd>Telescope find_files cwd=" .. vim.fn.stdpath("config") .. "<CR>", desc = "Config Files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
      -- search
      { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sp", "<cmd>Telescope builtin<CR>", desc = "Pickers" },
      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics_document<cr>", desc = "Diagnostics" },
      { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "Help Page" },
      { "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "Grep" },
      { "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
      { "<leader>sw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Word" },
      { "<leader>s:", "<cmd>Telescope command_history<CR>", desc = "Command History" },
      -- git
      { "<leader>gfc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
      { "<leader>gfC", "<cmd>Telescope git_bcommits<CR>", desc = "Commits (%)" },
      { "<leader>gff", "<cmd>Telescope git_files<CR>", desc = "Files (git-files)" },
      { "<leader>gfs", "<cmd>Telescope git_stash<CR>", desc = "Stash" },
      { "<leader>gfb", "<cmd>Telescope git_branches<CR>", desc = "Branches" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
    },
    opts = function()
      dofile(vim.g.based_cache .. "telescope")

      require("telescope").load_extension("fzf")

      return {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "󰥓 ",
          sorting_strategy = "ascending",
          path_display = { "filename_first" },
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            width = 0.75,
            height = 0.75,
          },

          mappings = {
            i = {
              ["<A-p>"] = require("telescope.actions.layout").toggle_preview,
            },
            n = {
              ["q"] = require("telescope.actions").close,
              ["<A-p>"] = require("telescope.actions.layout").toggle_preview,
              ["<C-l>"] = Otsuvim.telescope.toggle_preview_focus,
            },
          },
        },

        pickers = {
          find_files = {
            preview = {
              hide_on_startup = true,
            },
            find_command = function()
              return { "rg", "--files", "--color", "never", "-g", "!.git" }
            end,
            hidden = true,
          },
        },
      }
    end,
  },

  {
    "stevearc/oil.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>-", function() require("oil").toggle_float() end, desc = "Oil" },
    },
    opts = {
      keymaps = {
        ["q"] = "actions.close",
      },
      view_options = {
        show_hidden = true,
      },

      float = {
        max_width = 140,
        max_height = 25,
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    event = "LazyFile",
    cmd = { "TodoTelescope" },
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
    opts = {
      keywords = {
        FIX = { alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "DEBUG", "DEBUGGING" } },
        TEST = { alt = { "TESTING", "PASSED", "FAILED", "PROFILE", "PROFILING" } },
      },
    },
  },

  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({ transient = true, prefills = { filesFilter = ext and ext ~= "" and "*." .. ext or nil } })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
    opts = {},
  },
}
