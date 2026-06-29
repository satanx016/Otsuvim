return {
  {
    "nvim-mini/mini.icons",
    version = "*",
    opts = {},
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 0,
      preset = "helix",
      spec = {
        mode = { "n", "v" },
        { "<leader>f", group = "find" },
        { "<leader>s", group = "search" },
        { "gx", desc = "Open with system app" },
        { "[", desc = "prev" },
        { "]", desc = "next" },
        { "g", desc = "goto" },
        { "z", desc = "fold" },
      },
      win = {
        no_overlap = false,
      },
    },
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local exclude_filetypes = {
        man = true,
        help = true,
        lazy = true,
        mason = true,
        notify = true,
        NeogitStatus = true,
      }

      return {
        chunk = {
          enable = true,
          chars = {
            right_arrow = "─",
          },
          textobject = "as",
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
      -- NOTE: smells fishy
      vim.api.nvim_set_hl(0, "HLChunk1", { link = "Title" })
      vim.api.nvim_set_hl(0, "HLChunk2", { link = "ErrorMsg" })
    end,
  },
}
