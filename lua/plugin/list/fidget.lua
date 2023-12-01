return {
	{
		"j-hui/fidget.nvim",
		enabled = false,
		event = "UIEnter",
		config = function()
			require("fidget").setup()
		end,
	},
}
