local opt = { noremap = true, silent = true }
local map = vim.keymap.set

-- window jump and split
map("n", "<c-l>", "<c-w>l", opt)
map("n", "<c-down>", "<c-w>j", opt)
map("n", "<c-up>", "<c-w>k", opt)
map("n", "<c-left>", "<c-w>h", opt)
map("n", "<c-right>", "<c-w>l", opt)
map("n", "<leader>v", "<c-w>v", opt)
map("n", "<leader>s", "<c-w>s", opt)
-- logic line and view line
map("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
map("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

map("n", "<c-p>", "<cmd>Telescope find_files<cr>", opt)
map("n", "<c-r>", "<cmd>Telescope projects<cr>", opt)
map("n", "<c-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opt)
-- map("n", "<c-f>", "<cmd>Telescope grep_string<cr>", opt)	-- search string under cursor or the visual selection
-- map("n", "<c-f>", "<cmd>Telescope live_grep<cr>", opt)	-- search for a string
-- more info https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt
