local keymaps = {
	{
		'<c-s-p>',
		'<cmd>Legendary<cr>',
		mode = { 'n', 'i' },
		opts = { silent = true },
		description = 'show all commands',
	},

	-- telescope
	{ '<c-r>', '<cmd>Telescope project<cr>', mode={'n', 'i'}, description='list and select a project'},
	{ '<c-p>', '<cmd>Telescope find_files<cr>', mode={'n', 'i'}, description='find files'},
	{ '<c-f>', '<cmd>Telescope live_grep<cr>', mode={'n', 'i'}, description='search for a string'},
	{ '<f3>', '<cmd>Telescope current_buffer_fuzzy_find<cr>', mode={'n', 'i'}, description='search a string in current buffer'},

	-- edit
	{ '<a-enter>', '<esc>A', mode = { 'n', 'i' }, description = 'jump to end of line and edit' },

	{
		'<a-j>',
		{
			n = { '<cmd>MoveLine 1<cr>' },
			i = { '<cmd>MoveLine 1<cr>' },
			v = { '<cmd>MoveBlock 1<cr>' },
		},
		description = 'move down',
	}
}
return {
	'mrjones2014/legendary.nvim',
	config = function()
		require("legendary").setup({
			keymaps = keymaps,
		})
	end,
	dependencies = {
		'stevearc/dressing.nvim',
		config = function()
			require("dressing").setup({
				input = { relative = 'editor' },
				select = { backend = { 'telescope', 'fzf', 'builtin' } },
			})
		end
	}
}
