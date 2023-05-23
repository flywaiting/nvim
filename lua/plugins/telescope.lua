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
				defaults = {
					sorting_strategy = "ascending",
					path_display = "smart",
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							prompt_position = "top",
							mirror = true,
							-- height = 0.6,
						}
					}
				},
				pickers = {
					find_files = {
						-- theme = "dropdown",
						previewer = false,
						-- hidden = true,
					},
				},
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
