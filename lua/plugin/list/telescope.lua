-- local build = "make"
-- require cmake, build config
-- cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build
return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					sorting_strategy = "ascending",
					path_display = "smart",
					-- layout_strategy = "vertical",
					layout_config = {
						vertical = {
							prompt_position = "top",
							-- mirror = true,
						},
						horizontal = {
							prompt_position = "top",
							-- preview_width = 0.55,
							-- results_width = 0.8
						}
					},
					-- mappings =  {
					-- 	i = {
					-- 		["<cr>"] = function(bufnr)
					-- 			-- open in new buffer if not exit
					-- 			require("telescope.actions.set").edit(bufnr, "tab drop")
					-- 		end,
					-- 	},
					-- },
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
						hidden_file = true,
						on_project_selected = function(prompt_bufnr)
							require('telescope._extensions.project.actions').change_working_directory(prompt_bufnr, false)
						end
					},
					file_browser = {
						-- theme = "ivy",
						-- disable netrw
						hijack_netrw = true,
						initial_mode = "normal",
					}
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("project")
			telescope.load_extension("file_browser")
		end,
	},
}
