return {
	{
		"terrortylor/nvim-comment",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				opts = { enable_autocmd = false },
			},
		},
		keys = {
			{ [[<c-/>]], "<cmd>CommentToggle<cr>", mode = { "i", "n" }, desc = "Comment Line" },
			{ [[<c-/>]], ":CommentToggle<cr>", mode = { "v" }, desc = "Comment Block" },
		},
		opts = {
			comment_empty = false,
			comment_empty_trim_whitespace = false,
			hook = function()
				require("ts_context_commentstring").update_commentstring()
			end,
		},
		config = function(_, opts)
			require("nvim_comment").setup(opts)
		end,
	},
}
