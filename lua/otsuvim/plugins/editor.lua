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
    cmd = "Telescope",
    keys = {
      -- find
      { "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", desc = "Find All Files" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
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

      return {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },

          prompt_prefix = "   ",
          selection_caret = "󰥓  ",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            width = 0.87,
            height = 0.80,
          },

          mappings = {
            n = {
              ["q"] = require("telescope.actions").close,
              ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
              ["<C-h>"] = Otsuvim.telescope.toggle_preview_focus,
              ["<C-l>"] = Otsuvim.telescope.toggle_preview_focus,
            },
          },

          file_ignore_patterns = {
            "%.git/",
            "node_modules/",
            "%.mp3$",
            "%.ogg$",
            "%.m4a$",
            "%.opus$",
            "%.webp$",
            "%.jpg$",
            "%.jpeg$",
            "%.png$",
            "%.gif$",
            "%.mp4$",
            "%.gz$",
            "%.zip$",
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
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo's" },
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
