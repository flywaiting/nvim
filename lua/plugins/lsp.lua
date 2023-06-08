return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				-- standalone ui for nvim-lsp progress
				"j-hui/fidget.nvim",
				config = function()
					require("fidget").setup()
				end,
			},
			{
				"glepnir/lspsaga.nvim",
				-- event = "LspAttach",
				config = function()
					require("lspsaga").setup({
						symbol_in_winbar = {
							enable = false,
						},
					})
				end,
			},
		},
		config = function()
			vim.lsp.set_log_level("off")

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

			local hand_conf = {
				focusable = false, -- true
				style = "minimal",
				border = "rounded",
				-- max_width = 80,
				-- max_height = 20,
			}
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, hand_conf)
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, hand_conf)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					local bufnr = ev.buf
					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					local caps = client.server_capabilities
					if caps.completionProvider then
						-- Enable completion triggered by <c-x><c-o>
						vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
					end
					if caps.documentFormattingProvider then
						-- use lsp as the handler for formatexpr
						vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
					end
					if caps.definetionProvider then
						vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
					end

					-- auto formatting on save
					-- Avoiding LSP formatting conflicts https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("LspFormatting", {}),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
						-- callback = function()
						-- 	vim.lsp.buf.format({
						-- 		filter = function(client)
						-- 			return client.name == "null-ls"
						-- 		end,
						-- 		bufnr = bufnr,
						-- 	})
						-- end,
					})

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = bufnr, noremap = true, silent = true }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<space>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<space>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- for nvim-ufo
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.completion.completionItem.resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			}
			local opt = {
				capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
			}
			require('mason').setup()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require('lspconfig')[server_name].setup(opt)
				end,
				-- dedicated handler for specific servers
				lua_ls = function()
					print("lua-config")
					require("lspconfig").lua_ls.setup(vim.tbl_extend("force", opt, {
						settings = {
							Lua = {
								diagnostics = {
									-- get the language server to recognize the 'vim' global
									globals = { "vim" }
								},
							},
						},
					}))
				end,
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		enabled = false,
		config = function()
			local null = require("null-ls")
			null.setup({
				sources = {
					null.builtins.formatting.prettierd,
					null.builtins.formatting.shfmt,
					null.builtins.formatting.shellharden,
					null.builtins.formatting.fixjson,
					null.builtins.formatting.stylua,
					null.builtins.formatting.isort,
					null.builtins.formatting.black.with { extra_args = { "--fast" } },
					-- null.builtins.formatting.google_java_format,

					null.builtins.diagnostics.write_good,
					null.builtins.diagnostics.eslint_d,
					null.builtins.diagnostics.tsc,
					null.builtins.diagnostics.ruff.with { extra_args = { "--max-line-length=180" } },
					-- with_diagnostics_code(null.builtins.diagnostice.shellcheck),
					null.builtins.diagnostics.zsh,
					null.builtins.code_actions.gitsigns.with { disabled_filetypes = { "NeogitCommitMessage" } },
					null.builtins.code_actions.eslint_d,
					null.builtins.code_actions.gitrebase,
					null.builtins.code_actions.refactoring,
					null.builtins.code_actions.proselint,
					null.builtins.code_actions.shellcheck,

					null.builtins.hover.dictionary,
				},
			})
		end,
	},
}
