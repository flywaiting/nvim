-- local build = "make"
-- require cmake, build config
-- cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build
return {
	{
		"nvim-telescope/telescope.nvim",
		-- cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-project.nvim",
				config = function()
					require("telescope").load_extension("project")
				end,
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
			{
				"ahmedkhalf/project.nvim",
				config = function(_, opts)
					require("project_nvim").setup(opts)
					require("telescope").load_extension("projects")
				end,
			},
		},
		keys = {
			{ "<c-p>", "<cmd>Telescop find_files<cr>", mode = { "i", "n" }, desc = "Find Files" },
			{ "<c-s-f>", "<cmd>Telescop live_grep<cr>", mode = { "i", "n" }, desc = "Search String" },
			{ "<c-r>", "<cmd>Telescop project<cr>", mode = { "i", "n" }, desc = "Select Project" },
			{ "<c-b>", "<cmd>Telescop buffers<cr>", mode = { "i", "n" }, desc = "Switch Buffers" },
			{ '<c-f>', '<cmd>Telescope current_buffer_fuzzy_find<cr>', mode = { 'n', 'i' }, desc = 'Search String In Open Buffer' },
			-- grep_string: search string under cursor
		},
		opts = {
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
				mappings = {
					i = {
						-- open in new buffer is not exit
						--["<cr>"] = function(bufnr)
							--require("telescope.actions.set").edit(bufnr, "tab drop")
						--end,
						["<c-j>"] = function(...)
							return require("telescope.actions").move_selection_next(...)
						end,
						["<c-k>"] = function(...)
							return require("telescope.actions").move_selection_previous(...)
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
					hidden_file = true,
					on_project_selected = function(prompt_bufnr)
						require('telescope._extensions.project.actions').change_working_directory(prompt_bufnr, false)
					end
				},
			},
		},
	},
}
