return {
	Lua = {
		runtime = {
			version = "LuaJIT",
		},
		workspace = {
			checkThirdParty = false,
		},
		hint = {
			enable = true,
			arrayIndex = "Enable",
			setType = true,
		},
		diagnostics = {
			-- get the language server to recognize the 'vim' global
			globals = {
				"vim",
			}
		}
	}
}
