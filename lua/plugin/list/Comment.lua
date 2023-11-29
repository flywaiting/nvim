return {
	{
		"numToStr/Comment.nvim",
		keys = "<c-/>",
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})

			require("Comment").setup({
				toggler = { line = "<c-/>" },
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
		
	},
}
