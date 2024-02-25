return {
	{
		"akinsho/bufferline.nvim",
		event = "UIEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ [[<c-tab>]], "<cmd>BufferLineCycleNext<cr>", mode = { "i", "n" }, desc = "Next buffer" },
			{ [[<s-tab>]], "<cmd>BufferLineCyclePrev<cr>", mode = { "i", "n" }, desc = "Prev buffer" },
		},
		opts = {
			options = {
				-- mode = "tabs",
				separator_style = "slant" or "padded_slant",
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function (_, _, diag)
					local icons = require("config.icons").diagnostics
					local ret = (diag.error and icons.Error .. diag.error .. " " or "") .. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				-- offsets = {
				-- 	{
				-- 		filetype = "neo-tree",
				-- 		text = "Neo-tree",
				-- 		highlight = "Directory",
				-- 		text_align = "left",
				-- 	},
				-- },
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			-- fix bufferline when restoring a session
			-- vim.api.nvim_create_autocmd("BufAdd", {
			-- 	callback = function ()
			-- 		vim.schedule(function ()
			-- 			pcall(nvim_bufferline)
			-- 		end)
			-- 	end,
			-- })
		end,
	},
}
