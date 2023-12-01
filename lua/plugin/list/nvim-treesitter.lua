-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
-- need a compiler when install paser, and as all know windows hasn't default...
return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufEnter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			-- "m-demare/hlargs.nvim",
		},
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
				},
				sync_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					-- disable for large buf
					-- disable = function(lang, buf)
					-- end,
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<cr>",
						-- init_selection = "gnn",
						node_incremental = "<cr>",
						node_decremental = "<bs>",
						scope_incremental = "<tab>",
					},
				},
			})
			-- require("hlargs")

			-- vim.opt.foldmethod = "expr"
			-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	},
}
