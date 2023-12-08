return {
	"mrjones2014/legendary.nvim",
	dependencies = {
		{
			"stevearc/dressing.nvim",
			config = function ()
				require("dressing").setup({
					input = {
						relative = "editor",
					},
					select = {
						backend = {
							"telescope",
							"fzf",
							"builtin",
						},
					},
				})
			end,
		}
	}
}
