


vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- buffer local mapping
		-- LspUI for easy use?
	end,
})

return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		-- keys = "",	
		dependencies = {
			{
				"williamboman/mason.nvim",
				config = require("mason").setup(),
			},
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local default = require("plugin.list.lsp.list.lang_default.lua")

			local servers_handlers = {
				-- default handler
				function(server_name)
					local status, config = pcall(require, "plugin.list.lsp.list." .. server_name)
					if not status then
						lspconfig[server_name].setup(default)
					else 
						vim.tbl_deep_extend("keep", config, default)
					end
				end,
			}
		end,
	}
}
