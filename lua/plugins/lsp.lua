local hover = vim.lsp.buf.hover

vim.lsp.buf.hover = function()
    return hover {
        max_height = math.floor(vim.o.lines * 0.5),
        max_width = math.floor(vim.o.columns * 0.4),
    }
end

return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts = {
            PATH = 'skip'
        }
	},
}
