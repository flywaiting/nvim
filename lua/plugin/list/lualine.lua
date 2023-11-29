return {
	{
		"nvim-lualine/lualine.nvim",
		event = "UIEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- "f-person/git-blame.nvim",
		},
		config = function()
			require("lualine").setup({
				options = {
					disabled_filetypes = {
						"NvimTree",
					},
					-- section_separators = "",
					component_separators = "",
				},
				-- sections = {
				-- 	lualine_c = {
				-- 		{
				-- 			require("gitblame").get_current_blame_text,
				-- 			cond = require("gitblame").is_blame_text_available
				-- 		},
				-- 	},
				-- 	lualine_x = {
				-- 		{
				-- 			require("lazy.status").updates,
				-- 			cond = require("lazy.status").has_updates,
				-- 			color = { fg = "#ff9e64" },
				-- 		},
				-- 	},
				-- },
			})
		end,
	}
}
