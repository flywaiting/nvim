return {
	{
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
		},
		keys = {
			{ "<c-s-p>", "<cmd>FineCmdline<cr>", mode = { "i", "n" }, desc = "Redirect Cmdline" },
		},
		opts = {
			cmdline = {
				prompt = require("config.icons").prompt.cmdline,
			},
		}
	}
}
