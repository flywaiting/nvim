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
			{
				'nvim-telescope/telescope-project.nvim',
			}
			-- {
			-- 	'ahmedkhalf/project.nvim',
			-- 	config = function ()
			-- 		require("project_nvim").setup()
			-- 	end
			-- },
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
					},
					mappings = {
						i = {
							-- open in new buffer if not exit
							["<cr>"] = function(bufnr)
								require("telescope.actions.set").edit(bufnr, "tab drop")
							end,
						},
					},
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
					project = {
						sync_with_nvim_tree = true,
						hidden_files = true,
						on_project_selected = function(prompt_bufnr)
							require('telescope._extensions.project.actions').change_working_directory(prompt_bufnr, false)
						end
					}
				},
			})

			-- extensions
			telescope.load_extension("fzf")
			telescope.load_extension('project')
			-- telescope.load_extension("projects")
		end,
	},
}
