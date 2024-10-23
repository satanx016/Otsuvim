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

      local function toggle_preview_focus(prompt_bufnr)
        local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local previewer = picker.previewer
        local bufnr = previewer.state.bufnr
        -- stylua: ignore start
        vim.keymap.set("n", "<C-l>", function() vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", picker.prompt_win)) end, { buffer = bufnr })
        vim.keymap.set("n", "<C-h>", function() vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", picker.prompt_win)) end, { buffer = bufnr })
        -- stylua: ignore end
        vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", previewer.state.winid))
      end

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
              ["<C-h>"] = toggle_preview_focus,
              ["<C-l>"] = toggle_preview_focus,
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
    "folke/todo-comments.nvim",
    cmd = { "TodoTelescope" },
    event = "LazyFile",
    opts = {},
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo's" },
    },
  },
}
