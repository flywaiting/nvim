return {
	{
		"nvim-tree/nvim-tree.lua",
		-- keys = '<c-r>',
		-- cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
		event = 'VeryLazy',
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwplugin = 1
			require("nvim-tree").setup({
				filters = {
					dotfiles = true,
					custom = { ".git" },
				},
				view = {
					number = true,
					relativenumber = true,
				},

				respect_buf_cwd = true,
				-- update_focused_file = {
				-- 	enable = true,
				-- 	update_root = true,
				-- },
			})
		end,
	}
}
