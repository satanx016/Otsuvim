return {
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = function()
      dofile(vim.g.based_cache .. "git")

      return {
        signs = {
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "󱕖" },
        },
        signs_staged_enable = false,

        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          -- stylua: ignore start
          map("n", "[H", function() gs.nav_hunk("first") end, "First hunk")
          map("n", "]H", function() gs.nav_hunk("last") end, "Last hunk")
          map("n", "[h", function() gs.nav_hunk("prev") end, "Previous hunk")
          map("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
          map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")
          map("n", "<leader>ghs", gs.stage_hunk, "Stage hunk")
          map("n", "<leader>ghr", gs.reset_hunk, "Reset hunk")
          map("v", "<leader>ghs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk")
          map("v", "<leader>ghr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk")
          map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage hunk")
          map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
          map("n", "<leader>ghR", gs.reset_buffer, "Reset buffer")
          map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
          map("n", "<leader>gd", gs.diffthis, "Diff this")
          -- stylua: ignore end

          map({ "o", "x" }, "ah", "<Esc><cmd>Gitsigns select_hunk<CR>", "hunk")
        end,
      }
    end,
  },

  { "sindrets/diffview.nvim" },

  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
      -- stylua: ignore
      { "<leader>gD", function() require("neogit.integrations.diffview").open() end, desc = "Diffview", },
    },
    opts = function()
      dofile(vim.g.based_cache .. "neogit")
      return {}
    end,
  },
}
