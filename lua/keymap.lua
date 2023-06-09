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

map({ "n", "i" }, "<c-b>", "<cmd>NvimTreeToggle<cr>", opt)
map({ "n", "i" }, "<c-e>", "<cmd>NvimTreeFindFile<cr>", opt)

map({ 'n', 'i' }, [[<c-s-p>]], '<esc>:', opt)
