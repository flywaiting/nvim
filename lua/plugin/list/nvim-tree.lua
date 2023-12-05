-- TODO: auto toggle node or jump to parent/child
-- default keymap:
-- 		e, base rename, without extension
-- 		r, rename, with extension
-- 		x p, move
return {
	{
		"nvim-tree/nvim-tree.lua",
		-- event = "VeryLazy",
		-- keys = "<c-b>",
		cmd = "NvimTreeFindFileToggle",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"echasnovski/mini.base16",
		},
		config = function()
			require("nvim-tree").setup({
				disable_netrw = true,
				sync_root_with_cwd = true,
				filters = {
					dotfiles = true,
					custom = {
						"node_modules",
					},
				},
				actions = {
					open_file = {
						resize_window = true, 	-- first open resize adapt
						quit_on_open = true,
					},
				},
			})
		end,
	}
}
