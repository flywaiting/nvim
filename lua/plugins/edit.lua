return {
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		-- keys = { "gc", "gcc", "gbc" },
		config = function()
			require("Comment").setup()
		end,
	},
}
