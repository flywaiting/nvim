return {
	{
		"RRethy/nvim-base16",
		event = "VimEnter",
		-- lazy = true,
		config = function()
			vim.cmd.colorscheme("base16-tender")
		end,
		enabled = false,
	},
	{
		"sainnhe/everforest",
		-- event = "VimEnter",
		config = function()
			vim.g.everforest_diagnostic_line_highlight = 1
			vim.cmd.colorscheme("everforest")
			vim.g.everforest_background = "soft"
			vim.fn.sign_define({
				{
					name = "DiagnosticSignError",
					text = "E",
					texthl = "DiagnosticSignError",
					linehl = "ErrorLine",
				},
				{
					name = "DiagnosticSignWarn",
					text = "W",
					texthl = "DiagnosticSignWarn",
					linehl = "WarningLine",
				},
				{
					name = "DiagnosticSignInfo",
					text = "I",
					texthl = "DiagnosticSignInfo",
					linehl = "InfoLine",
				},
				{
					name = "DiagnosticSignHint",
					text = "H",
					texthl = "DiagnosticSignHint",
					linehl = "HintLine",
				},
			})
		end,

	},
}
