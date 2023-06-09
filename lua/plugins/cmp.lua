return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
		{
			"L3MON4D3/LuaSnip",
			config = function()
				require("luasnip.loaders.from_vscode").load({
					-- include = { "c", "go", "python", "sh", "json", "lua", "gitcommit", "sql", "markdown" },
				})
				-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.expand("~/.config/nvim/my_snippets") } })
				-- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/my_snippets/lua/" })
				-- require("go").setup({})
			end,
			-- Snippets collection for a set of different programming languages.
			-- https://github.com/rafamadriz/friendly-snippets
			dependencies = "rafamadriz/friendly-snippets",
		},
	},
	config = function()
		local luasnip = require("luasnip")
		-- nvim-cmp setup
		local cmp = require("cmp")
		-- https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques#add-parentheses-after-selecting-function-or-method-item
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		if cmp == nil then
			return
		end

		local lspkind = require("lspkind")
		cmp.setup({
			-- show source name in menu
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						dictionary = "[Dictionary]",
						path = "[Path]",
						cmp_tabnine = "[TabNine]",
						-- cmp_jira = "[Jira]",
					},
				}),
			},

			-- https://www.reddit.com/r/neovim/comments/t7jl7p/cmp_autocomplete_in_golang_does_not_autoselect/
			preselect = cmp.PreselectMode.None,
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				-- abort
				["<C-c>"] = cmp.mapping.abort(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({
					-- https://github.com/golang/go/issues/40871
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			sources = {
				{ name = "luasnip",                priority = 100 },
				{ name = "nvim_lsp",               priority = 90 },
				-- { name = "cmp_tabnine", priority = 98, max_item_count = 2, keyword_length = 3 },
				{ name = "buffer",                 priority = 80, max_item_count = 3, keyword_length = 5 },
				{ name = "path",                   priority = 80, max_item_count = 3, keyword_length = 3 },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lua" },
				-- disable fuzzy
				-- { name = "dictionary", priority = 10, max_item_count = 5, keyword_length = 5 },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline", max_item_count = 30 },
			}),
		})
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
		-- cmp.setup.filetype("gitcommit", {
		-- 	sources = cmp.config.sources({
		-- 		{ name = "cmp_jira", max_item_count = 5, keyword_length = 2 },
		-- 		{ name = "luasnip", priority = 100 },
		-- 		{ name = "buffer", keyword_length = 3 },
		-- 		{ name = "dictionary", priority = 10, max_item_count = 5, keyword_length = 3 },
		-- 	}),
		-- })

		cmp.setup.filetype("markdown", {
			sources = cmp.config.sources({
				-- { name = "cmp_jira", max_item_count = 5, keyword_length = 2 },
				{ name = "luasnip",    priority = 100 },
				{ name = "buffer",     keyword_length = 3 },
				{ name = "dictionary", priority = 10,     max_item_count = 5, keyword_length = 3 },
			}),
		})
		-- local source = require("jira")
		-- require("cmp").register_source("cmp_jira", source.new({}))
		-- require("go_test")
	end,
}
