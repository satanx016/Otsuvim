return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.based_cache .. "devicons")
      return { override = require("otsu-ui.icons.devicons") }
    end,
  },

  {
    "satanx016/based",
    build = function()
      require("based").load_all_highlights()
    end,
  },

  {
    "satanx016/otsu-ui",
    event = "UIEnter",
    opts = function()
      dofile(vim.g.based_cache .. "defaults")
      dofile(vim.g.based_cache .. "statusline")
      return {}
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = function()
      dofile(vim.g.based_cache .. "notify")

      return {
        stages = "static",
        timeout = 3700,
        -- stylua: ignore start
        max_height = function() return math.floor(vim.o.lines * 0.5) end,
        max_width = function() return math.floor(vim.o.columns * 0.4) end,
        icons = { ERROR = "󰅙 ", WARN = " ", INFO = " ", DEBUG = " ", TRACE = " " },
        -- stylua: ignore end
      }
    end,
  },

  { "MunifTanjim/nui.nvim" },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "<leader>sn", "", desc = "+Noice" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Last Message" },
      { "<leader>snh", function() require("noice").cmd("pick") end, desc = "History" },
    },
    opts = function()
      return {
        cmdline = { format = { cmdline = { icon = " " } } },

        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },

          documentation = {
            opts = {
              win_options = {
                winhighlight = {
                  Normal = "CmpDoc",
                  FloatBorder = "CmpDocBorder",
                },
              },
            },
          },
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              any = {
                { find = "%d+L, %d+B" },
                { find = "; after #%d+" },
                { find = "; before #%d+" },
              },
            },
            view = "mini",
          },
        },

        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          lsp_doc_border = true,
        },
      }
    end,
  },

  {
    "satanx016/hlchunk.nvim",
    branch = "better-chunk-keymapping",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local exclude_filetypes = {
        man = true,
        help = true,
        norg = true,
        lazy = true,
        mason = true,
        notify = true,
        NvimTree = true,
        NeogitStatus = true,
      }

      return {
        chunk = {
          enable = true,
          chars = {
            right_arrow = "─",
          },
          textobject = { keymap = "as", desc = "scope" },
          exclude_filetypes = exclude_filetypes,
        },
        indent = {
          enable = true,
          chars = { "│" },
          exclude_filetypes = exclude_filetypes,
        },
      }
    end,
    config = function(_, opts)
      require("hlchunk").setup(opts)
      dofile(vim.g.based_cache .. "hlchunk")
    end,
  },

  {
    "stevearc/dressing.nvim",
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      spec = {
        {
          { "<leader>c", group = "Code" },
          { "<leader>f", group = "File/Find" },
          { "<leader>s", group = "Search" },
          { "<leader>g", group = "Git" },
          { "<leader>gf", group = "Find" },
          { "<leader>gh", group = "Hunk" },
          { "<leader>u", group = "UI", icon = { icon = "󰙵 ", color = "azure" } },
          { "<leader>p", group = "Projects", icon = { icon = "󰉋 ", color = "blue" } },
          { "<leader>L", icon = { icon = "󰒲", color = "azure" } },
          { "<leader>M", icon = { icon = "󱌢", color = "yellow" } },
          { "<leader>n", group = "Neorg", icon = { icon = "󱚌", color = "grey" } },
          { "<leader>b", group = "Buffer" },
          -- stylua: ignore
          { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Keymaps (which-key)" },
          { "gx", desc = "Open with system app" },
        },
      },
      win = {
        no_overlap = false,
      },
    },
    config = function(_, opts)
      dofile(vim.g.based_cache .. "whichkey")
      require("which-key").setup(opts)
    end,
  },
}
