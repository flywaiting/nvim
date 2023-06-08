local keymaps = {
	{
		'<c-s-p>',
		'<cmd>Legendary<cr>',
		mode = { 'n', 'i' },
		opts = { silent = true },
		description = 'show all commands',
	},

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
