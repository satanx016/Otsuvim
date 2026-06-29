-- NOTE: this module should create toggles for options (currently)

local Toggle = {}
Toggle.__index = Toggle

local M = setmetatable({}, {
    __call = function(_, opts)
        return setmetatable({
            opts = opts,
            get = function()
                return vim.opt_local[opts.name]:get()
            end,
            set = function(new_state)
                vim.opt_local[opts.name] = new_state
            end,
        }, Toggle)
    end
})

function Toggle:flip()
    self.set(not self.get())
end

function Toggle:map(key)
    vim.keymap.set("n", key, function() self:flip() end)

    require("which-key").add({
        key,
        icon = function()
            return self.get() and { icon = " ", color = "green" } or { icon = " ", color = "yellow" }
        end,
        desc = function()
            return (self.get() and "Disable " or "Enable ") .. self.opts.name
        end,
    })
end

return M
