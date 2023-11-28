local opt = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<c-b>", ":NvimTreeToggle<cr>", opt)
map("i", "<c-b>", "<esc>:NvimTreeToggle<cr>", opt)

map("n", "<c-s>", ":w<cr>", opt)
map("i", "<c-s>", "<esc>:w<cr>", opt)

map("n", "sv", ":vsp<cr>", opt)
map("n", "sh", ":sp<cr>", opt)
map("n", "sc", "<c-w>c", opt)	-- close current 
map("n", "so", "<c-w>o", opt)	-- close other
-- window jump
map("n", "<c-down>", "<c-w>j", opt)
map("n", "<c-up>", "<c-w>k", opt)
map("n", "<c-left>", "<c-w>h", opt)
map("n", "<c-right>", "<c-w>l", opt)

map("n", "q", ":q<cr>", opt)
map("n", "qq", ":q!<cr>", opt)
map("n", "Q", ":qa!<cr>", opt)

-- logic line and view line
map("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
map("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })


-- map({ 'n', 'i' }, [[<c-s-p>]], '<esc>:', opt)
