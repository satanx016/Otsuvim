---@type vim.lsp.Config
return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { ".stylua.toml", "stylua.toml", "selene.toml"}, { ".git" } },
    settings = {
        Lua = {
            codeLens = {
                enable = true
            },
            hint = {
                enable = true,
                semicolon = "Disable"
            },
            runtime = { version = 'LuaJIT' },
            workspace = {
                checkThirdParty = false,
            }
        }
    },
}
