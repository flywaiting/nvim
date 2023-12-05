return {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,								-- install dir/share/nvim/runtime
					-- vim.fn.expand("$VIMRUNTIME/lua"),
					-- vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
					vim.fn.stdpath("config") .. "lua",				-- self config/lua
				}
			},
			hint = {
				enable = true,
				arrayIndex = "Enable",
				setType = true,
			},
			diagnostics = {
				enable = true,
				-- get the language server to recognize the 'vim' global
				globals = {
					"vim",
					"describe",
					"it",
					"before_each",
					"after_each",
				},
			},
		}
	}
}
