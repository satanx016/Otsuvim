return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
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
        FIX = { alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "DEBUG" } },
      },
    },
  },
}
