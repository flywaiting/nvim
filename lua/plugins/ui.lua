return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function ()
			-- @diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function (...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.select(...)
			end
			vim.ui.input = function (...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
}
