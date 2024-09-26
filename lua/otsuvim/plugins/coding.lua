return {
	{ "Bilal2453/luvit-meta" }, -- `vim.uv` typings

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = { library = { { path = "luvit-meta/library", words = { "vim%.uv" } } } },
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = function()
					return {
						history = true,
						updateevents = "TextChanged,TextChangedI",
					}
				end,
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					-- lua format
					require("luasnip.loaders.from_lua").load()
					require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })
					-- vscode format
					require("luasnip.loaders.from_vscode").lazy_load()

					vim.api.nvim_create_autocmd("InsertLeave", {
						callback = function()
							if
								require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
								and not require("luasnip").session.jump_active
							then
								require("luasnip").unlink_current()
							end
						end,
					})
				end,
			},

			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			dofile(vim.g.based_cache .. "cmp")
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true }) -- for colorschemes missing this

			local cmp = package.loaded["cmp"]

			return {
				completion = { completeopt = "menu,menuone" },
				window = {
					completion = {
						winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
						scrollbar = true,
						border = Otsuvim.cmp.get_border("CmpBorder"),
					},
					documentation = {
						border = Otsuvim.cmp.get_border("CmpDocBorder"),
						winhighlight = "Normal:CmpDoc",
					},
				},
				snippet = {
					expand = function(args)
						package.loaded["luasnip"].lsp_expand(args.body)
					end,
				},
				formatting = Otsuvim.cmp.get_formatting_style(),
				mapping = {
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<ESC>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
					["<Tab>"] = Otsuvim.cmp.select_next(),
					["<S-Tab>"] = Otsuvim.cmp.select_prev(),
				},
				sources = {
					{ name = "lazydev", group_index = 0 },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "nvim_lua" },
					{ name = "path" },
				},
				experimental = { ghost_text = { hl_group = "CmpGhostText" } },
			}
		end,
	},
}
