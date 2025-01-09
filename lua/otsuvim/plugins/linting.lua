return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "selene" } },
  },

  {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    opts = {
      linters_by_ft = {
        fish = { "fish" },
        lua = { "selene" },
      },
    },
    config = function(_, opts)
      require("lint").linters_by_ft = opts.linters_by_ft

      local filetypes = (function(tbl)
        local ret = {}
        for k in pairs(tbl) do
          table.insert(ret, k)
        end
        return ret
      end)(opts.linters_by_ft)

      local debounce = nil
      vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("nvim-lint", {}),
        callback = function(e)
          -- Do nothing(v1.0) on non-concerned filetypes
          if not vim.tbl_contains(filetypes, vim.bo[e.buf].filetype) then
            return
          end

          if debounce then
            vim.fn.timer_stop(debounce)
          end
          debounce = vim.fn.timer_start(
            200,
            vim.schedule_wrap(function()
              -- Do nothing(v2.0) if by chance current buffer changed before the debounce time
              if e.buf == vim.api.nvim_get_current_buf() then
                require("lint").try_lint()
              end
            end)
          )
        end,
      })
    end,
  },
}
