return {
	{
		"terrortylor/nvim-comment",
		-- keys = "<c-/>",
		keys = { "gcc", "gc" },
		cmd = "CommentToggle",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				config = function()
					require("ts_context_commentstring").setup({
						enable_autocmd = false,
					})
				end,
			},
		},
		config = function()
			require("nvim_comment").setup({
				comment_empty = false,
				comment_empty_trim_whitespace = false,
				hook = function()
					require("ts_context_commentstring").update_commentstring()
				end,
			})
		end,
		
	},
}
