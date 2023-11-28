return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-project.nvim",
				dependencies = "nvim-tree/nvim-tree.lua",
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					mappings =  {
						i = {
							["<cr>"] = function(bufnr)
								-- open in new buffer if not exit
								require("telescope.actions.set").edit(bufnr, "tab drop")
							end,
						},
					},
					file_ignore_patterns = {
						"node_modules",
						"dist",
					},
				},
				pickers = {
					find_files = {
						hidden = false,
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
						hidden_file = true,
						on_project_selected = function(prompt_bufnr)
							require('telescope._extensions.project.actions').change_working_directory(prompt_bufnr, false)
						end
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("project")
		end,
	},
}
