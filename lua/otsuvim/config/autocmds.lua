local autocmd = vim.api.nvim_create_autocmd

-- Help/Man Veritcal split
autocmd("BufWinEnter", {
	pattern = { "*.txt", "*(*)" },
	callback = function()
		if vim.bo.filetype == "help" or vim.bo.filetype == "man" then
			vim.cmd("wincmd L")
		end
	end,
})
