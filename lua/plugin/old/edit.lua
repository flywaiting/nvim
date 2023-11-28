return {
	{
		'kevinhwang91/nvim-ufo',
		keys = { 'za' },
		dependencies = {
			'kevinhwang91/promise-async',
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require "statuscol.builtin"
					require("statuscol").setup {
						relculright = true,
						segments = {
							{ text = { builtin.foldfunc },      click = "v:lua.ScFa" },
							{ text = { "%s" },                  click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					}
				end,
			},
		},
		config = function()
			vim.opt.foldcolumn = '1'
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.opt.foldenable = true

			vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
			vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

			-- require('ufo').setup({
			-- 	provider_selector = function (_, _)
			-- 		return { 'lsp', 'treesitter', 'indent' }
			-- 	end
			-- })
			require('ufo').setup()
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = function()
			vim.opt.list = true
			require("indent_blankline").setup({
				show_current_context = true,
				-- show_current_context_start = true,
			})
		end
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		config = function()
			-- Set barbar's options
			require("bufferline").setup({
				options = {
					mode = "tabs",
					-- numbers = "none",
					diagnostices = "nvim_lsp",
					separator_style = "slant" or "padded_slant",
					-- show_tab_indicators = true,
					show_buffer_close_icons = true,
					show_close_icon = false,
					color_icons = true,
					-- enforce_reqular_tabs = false,
				}
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		-- event = "BufRead",
		keys = { "gc", "gcc", "gbc" },
		config = function()
			require("Comment").setup()
		end,
	},
	{
		'fedepujol/move.nvim',
		cmd = { 'MoveLine', 'MoveWord', 'MoveBlock' },
	}
}
