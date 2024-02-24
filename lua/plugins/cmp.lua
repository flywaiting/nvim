return {
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",		-- source language server client
			"hrsh7th/cmp-buffer",		-- source buffer
			"hrsh7th/cmp-path", 		-- source path

			"hrsh7th/cmp-cmdline",		-- for cmdline
			"hrsh7th/cmp-nvim-lua", 	-- source neovim api
			"hrsh7th/cmp-nvim-lsp-signature-help", 	-- display function signatures
			-- "lukas-reineke/cmp-rg",

			-- "onsails/lspkind.nvim",

			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				opts = {
					-- history = true,
					delete_check_events = "TextChanged",
				}
			},
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
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
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local defaults = require("cmp.config.default")()
			local has_words_before = require("config.util").has_words_before

			return {
				completion = { completeopt = "menu,menuone,noinsert", },
				preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-c>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({
						-- https://github.com/golang/go/issues/40871
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<tab>"] = cmp.mapping(function(cb)
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						elseif cmp.visible() then
							cmp.select_next_item()
						elseif has_words_before() then
							cmp.complete()
						else
							cb()
						end
					end, { "i", "s" }),
					["<s-tab>"] = cmp.mapping(function(cb)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							cb()
						end
					end, { "i", "s" }),
					-- ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					-- ["<s-tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					-- { name = "rg" },
					{ name = "path" },
				}, {
					{ name = "buffer" }
				}),
				formatting = {
					format = function(_, item)
						local icons = require("config.icons").kinds
						if icons[item.kind] then
							item.kind = icons[item.kind] .. item.kind
						end
						return item
					end,
				},
				experimental = {
					ghost_text = {
						hl_group = "CmpGhpstText",
					},
				},
				sorting = defaults.sorting,
			}
		end,
		config = function(_, opts)
			for _, source in ipairs(opts.sources) do
				source.group_index = source.group_index or 1
			end

			local cmp = require("cmp")
			cmp.setup(opts)
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { { name = "buffer" } },
			})
		end,
	},
}
