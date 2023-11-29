return {
	{
		"j-hui/fidget.nvim",
		event = "UIEnter",
		config = function()
			require("fidget").setup()
		end,
	},
}
