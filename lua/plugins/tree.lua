return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
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
			})
		end,
	}
}
