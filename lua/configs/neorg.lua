local options = {
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
				},
				default_workspace = "notes",
			},
		},
	},
}

vim.wo.conceallevel = 2 -- enable neorg markdown

require("neorg").setup(options)
