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
        fps = 60,
        top_down = false,
        max_height = function()
          return math.floor(vim.o.lines * 0.5)
        end,
        max_width = function()
          return math.floor(vim.o.columns * 0.6)
        end,
      }
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = function()
      return {
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
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = function()
      return {
        indent = { char = "│", highlight = "IblChar" },
        scope = { char = "│", highlight = "IblScopeChar" },
        exclude = {
          filetypes = {
            "man",
            "help",
            "norg",
            "lazy",
            "mason",
            "notify",
            "NvimTree",
            "NeogitStatus",
          },
        },
      }
    end,
    config = function(_, opts)
      dofile(vim.g.based_cache .. "blankline")

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.based_cache .. "blankline")
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
    opts = function()
      dofile(vim.g.based_cache .. "whichkey")

      return {
        preset = "modern",
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
          },
        },
        win = {
          no_overlap = false,
        },
      }
    end,
  },
}
