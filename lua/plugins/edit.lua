return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		config = function()
			-- Set barbar's options
			require("bufferline").setup({
				options = {
					mode = "tabs",
					-- numbers = "none",
					diagnostices = "nvim_lsp",
					separator_style = "slant" or "padded_slant",
					-- show_tab_indicators = true,
					show_buffer_close_icons = true,
					show_close_icon = false,
					color_icons = true,
					-- enforce_reqular_tabs = false,
				}
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		-- keys = { "gc", "gcc", "gbc" },
		config = function()
			require("Comment").setup()
		end,
	},
}
