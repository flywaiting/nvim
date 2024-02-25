-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
-- need a compiler when install paser, and as all know windows hasn't default...
return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		event = "LazyFile",
		-- event = "BufEnter",
		init = function (plugin)
			-- learn from lazyvim
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		dependencies = {
			-- "m-demare/hlargs.nvim",
		},
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		opts = {
			ensure_installed = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				-- disable for large buf
				-- disable = function(lang, buf)
				-- end,
			},
			sync_install = false,
			indent = { enable= true },
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
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
