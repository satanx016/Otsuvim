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
					map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
					map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
					map("n", "[h", function() gs.nav_hunk("prev") end, "Prev Hunk")
					map("n", "]h", function() gs.nav_hunk("next") end, "Next Hunk")
					map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
					map("n", "<leader>ghs", gs.stage_hunk, "Stage Hunk")
					map("n", "<leader>ghr", gs.reset_hunk, "Reset Hunk")
					map("v", "<leader>ghs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Hunk")
					map("v", "<leader>ghr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Hunk")
					map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
					map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
					map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
					map("n", "<leader>ghb", gs.blame_line, "Blame")
					map("n", "<leader>ghB", function() gs.blame_line({ full = true }) end, "Full Blame")
					map("n", "<leader>gd", gs.diffthis, "Diff This")
          -- stylua: ignore end
        end,
      }
    end,
  },

  { "sindrets/diffview.nvim" },

  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    opts = function()
      dofile(vim.g.based_cache .. "neogit")
      return {}
    end,
  },
}
