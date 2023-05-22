return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		-- keys = {
		-- 	{ "<c-p>", "<cmd>Telescope find_files<cr>", desc = "find files", mode = { "n", "i" }},
		-- 	{ "<c-r>", "<cmd>Telescope projects<cr>", desc = "access recently projects", mode = { "n", "i" }},
		-- },
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"ahmedkhalf/project.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			-- extensions
			telescope.load_extension("fzf")
			telescope.load_extension("projects")
		end,
	},
}
