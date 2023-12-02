return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",		-- source language server client
			"hrsh7th/cmp-buffer",		-- source buffer
			"hrsh7th/cmp-cmdline",		-- for cmdline
			"hrsh7th/cmp-path", 		-- source path
			"hrsh7th/cmp-nvim-lua", 	-- source neovim api
			"hrsh7th/cmp-nvim-lsp-signature-help", 	-- display function signatures

			"onsails/lspkind.nvim",

			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				config = function()
					-- load self snippets
					-- require("luasnip.loaders.from_vscode").lazy_load({ paths = "" })
				end,
			},

			{
				"windwp/nvim-autopairs",
				config = function()
					require("nvim-autopairs").setup({
						check_ts = true,		-- tree sitter
					})
				end,
			},
		},
		config = function()
			local cmp = require("cmp")
			-- https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques#add-parentheses-after-selecting-function-or-method-item
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			local lspkind = require("lspkind")
			cmp.setup({
				-- https://www.reddit.com/r/neovim/comments/t7jl7p/cmp_autocomplete_in_golang_does_not_autoselect/
				preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-c>"] = cmp.mapping.abort(),
					-- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
					-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
					-- ["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({
						-- https://github.com/golang/go/issues/40871
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						-- elseif luasnip.expand_or_locally_jumpable() then
						-- 	luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						-- elseif luasnip.jumpable(-1) then
						-- 	luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						menu = {
							nvim_lsp = "[LSP]",
							buffer = "[Buf]",
							luasnip = "[Snip]",
							nvim_lsp_signature_help = "[Args]",
							path = "[Path]",
							nvim_lua = "[Lua]"
						}
					}),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {{ name = "buffer" }}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { { name = "buffer" } },
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
			})

			-- cmp.setup.filetype("gitcommit", {
		end,
	},
}
