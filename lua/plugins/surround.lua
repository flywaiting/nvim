return {
    "echasnovski/mini.surround",
	-- event = "LazyFile",
	opts = {
		mappings = {
			add = "<leader>sa", -- Add surrounding in Normal and Visual modes
			delete = "<leader>sd", -- Delete surrounding
			find = "<leader>sf", -- Find surrounding (to the right)
			find_left = "<leader>sF", -- Find surrounding (to the left)
			highlight = "<leader>sh", -- Highlight surrounding
			replace = "<leader>sr", -- Replace surrounding
			update_n_lines = "<leader>sn", -- Update `n_lines`
		},
	},
	keys = function ()
		-- Populate the keys based on the user's options
		local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
		local opts = require("lazy.core.plugin").values(plugin, "opts", false)
		return {
			{ opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
			{ opts.mappings.delete, desc = "Delete surrounding" },
			{ opts.mappings.find, desc = "Find right surrounding" },
			{ opts.mappings.find_left, desc = "Find left surrounding" },
			{ opts.mappings.highlight, desc = "Highlight surrounding" },
			{ opts.mappings.replace, desc = "Replace surrounding" },
			{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
		}
	end,
}
