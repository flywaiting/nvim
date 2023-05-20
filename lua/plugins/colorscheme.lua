return {
	{
		"RRethy/nvim-base16",
		event = "VimEnter",
		-- lazy = true,
		config = function()
			vim.cmd.colorscheme("base16-tender")
		end,
	},
}
