return {
	{
		"akinsho/bufferline.nvim",
		event = "UIEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("bufferline").setup({
				options = {
					close_command = "bd! %d",
					-- right_mouse_command = "bd! %d",
					diagnostics = "nvim_lsp",
				},
			})
		end,
	},
}
