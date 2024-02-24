return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		enabled = false,
		-- keys = "",	
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()

			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup()

			local lspconfig = require("lspconfig")
			local default = require("plugins.lsp.configs.lang_default")
			mason_lspconfig.setup_handlers({
				function(server_name)
					local status, config = pcall(require, "plugins.lsp.configs." .. server_name)
					if not status then
						lspconfig[server_name].setup(default)
					else
						lspconfig[server_name].setup(vim.tbl_deep_extend("keep", config, default))
					end
				end,
			})
		end,
	},
}
