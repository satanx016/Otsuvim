return {
    {
        'natecraddock/workspaces.nvim',
        config = function()
            require('workspaces').setup()
            require('telescope').load_extension('workspaces')
        end,
    },
    {
        'stevearc/resession.nvim',
        config = function()
            local resession = require("resession")

            vim.keymap.set('n', '<leader>ms', resession.save and resession.save_tab)
            vim.keymap.set('n', '<leader>ml', resession.load)
            vim.keymap.set('n', '<leader>md', resession.delete)

            resession.setup({
                buf_filter = function(bufnr)
                    local buftype = vim.bo[bufnr].buftype
                    if buftype == 'help' then
                        return true
                    end
                    if buftype ~= "" and buftype ~= "acwrite" then
                        return false
                    end
                    if vim.api.nvim_buf_get_name(bufnr) == "" then
                        return false
                    end

                    -- this is required, since the default filter skips nobuflisted buffers
                    return true
                end,
                extensions = { scope = {} }, -- add scope.nvim extension
            })

            vim.api.nvim_create_autocmd("VimLeavePre", {
                callback = function()
                    -- Always save a special session named "last"
                    resession.save("last")
                end,
            })
        end
    },
    {
        'anuvyklack/help-vsplit.nvim',
        config = function()
            require('help-vsplit').setup {
                always = true,
                side = 'right',
                buftype = { 'help' },
                filetype = { 'man' }
            }
        end,
    },
    {
        'max397574/better-escape.nvim',
        config = function()
            require('better_escape').setup {
                mapping = { 'kj', 'jk' },   -- a table with mappings to use
                timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
                clear_empty_lines = false,  -- clear line after escaping if there is only whitespace
                keys = '<Esc>l',            -- keys used for escaping, if it is a function will use the result everytime
            }
        end,
    },
    {
        'IogaMaster/neocord',
        event = "VeryLazy",
        cond = io.popen('pgrep -x electron'):read("*n") ~= nil,

        config = function()
            require('neocord').setup({
                -- General options
                --logo                = 'https://media.tenor.com/2c7diqh1oVIAAAAC/anime-computer.gif',
                --logo                = 'https://64.media.tumblr.com/3266909503ce1b116b12d749cdf79bd2/f88eb9d10119c5f2-0f/s1280x1920/b58f793f41b65bec13387a0496c8c05c59a52b06.gif',
                logo = 'https://64.media.tumblr.com/ba8c705edd2bed0a28d9458811155d69/tumblr_onxkyoloha1w05w8zo1_500.gif',
                logo_tooltip        = 'Yet Another Vimmer',  -- nil or string
                main_image          = "logo",                -- "language" or "logo"
                neovim_image_text   = "The One True Text Editor",
                client_id           = "1157438221865717891", -- Use your own Discord application client id (not recommended)
                log_level           = nil,                   -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
                debounce_timeout    = 10,                    -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
                blacklist           = {},                    -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
                file_assets         = {},                    -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
                show_time           = true,                  -- Show the timer
                global_timer        = true,                  -- if set true, timer won't update when any event are triggered
                enable_line_number  = true,

                -- Rich Presence text options
                editing_text        = "Editing %s",         -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
                file_explorer_text  = "Browsing %s",        -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
                git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
                plugin_manager_text = "Managing plugins",   -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
                reading_text        = "Reading %s",         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
                workspace_text      = "Working on %s",      -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
                line_number_text    = "Line %s out of %s",  -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
                terminal_text       = "Using Terminal",     -- Format string rendered when in terminal mode.
            })
        end,
    },
}
