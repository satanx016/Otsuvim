return {
  {
    "stevearc/oil.nvim",
    keys = {
      {
        "<leader>-",
        function()
          require("oil").toggle_float()
        end,
        desc = "Oil",
      },
    },
    opts = {
      keymaps = {
        ["q"] = "actions.close",
        ["<C-d>"] = "actions.preview_scroll_down",
        ["<C-u>"] = "actions.preview_scroll_up",
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        max_width = 140,
        max_height = 25,
      },
      preview_win = {
        preview_method = "scratch",
      },
    },
  },

  {
    "ibhagwan/fzf-lua",
    keys = {
      -- find
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Files" },
      { "<leader>fc", "<cmd>FzfLua files cwd=" .. vim.fn.stdpath("config") .. "<CR>", desc = "Config Files" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
      -- search
      { "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
      { "<leader>sg", "<cmd>FzfLua grep_visual<cr>", mode = "x", desc = "Grep" },
      { "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help" },
      { "<leader>sk", "<cmd>FzfLua keymaps<CR>", desc = "Keymaps" },
      -- other
      { "z=", "<cmd>FzfLua spell_suggest<cr>", desc = "Spelling Suggestions" },
    },
    opts = function()
      local actions = require("fzf-lua.actions")
      return {
        keymap = {
          builtin = {
            ["<C-/>"] = "toggle-help",
            ["<C-p>"] = "toggle-preview",
            ["<C-d>"] = "preview-page-down",
            ["<C-u>"] = "preview-page-up",
          },
        },
        helptags = {
          actions = {
            -- Open help pages in a vertical split.
            ["enter"] = actions.help_vert,
          },
        },
        ui_select = function(ui_opts)
          ui_opts.winopts = { height = 0.5, width = 0.4 }
          return ui_opts
        end,
      }
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "LazyFile",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      -- stylua: ignore start
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo" },
      { "<leader>st", "<cmd>TodoFzfLua<cr>", desc = "Todo (all)" },
      { "<leader>sT", function() require("todo-comments.fzf").todo({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
      -- stylua: ignore end
    },
    opts = {},
  },
}
