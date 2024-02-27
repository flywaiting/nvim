return {
	{
		"RRethy/vim-illuminate",
		cmd = "IlluminateToggle",
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
		},
		config = function (_, opts)
			require("illuminate").configure(opts)
		end,
		keys = {
			{ "]]", "v:lua.require'illuminate'.goto_next_reference(false)", desc = "Next Reference" },
			{ "[[", "v:lua.require'illuminate'.goto_prev_reference(false)", desc = "Prev Reference" },
		}
	}
}
