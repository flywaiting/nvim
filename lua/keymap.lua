local map = require("utils").map


-- map("n", "<c-s>", ":w<cr>")
map("in", "<c-s>", "<esc>:w<cr>")

map("n", "sv", ":vsp<cr>")
map("n", "sh", ":sp<cr>")
map("n", "sc", "<c-w>c")	-- close current 
map("n", "so", "<c-w>o")	-- close other
-- window jump
map("n", "<c-down>", "<c-w>j")
map("n", "<c-up>", "<c-w>k")
map("n", "<c-left>", "<c-w>h")
map("n", "<c-right>", "<c-w>l")

-- map("n", "q", ":q<cr>")
map("n", "qq", ":bd<cr>")
map("n", "Q", ":qa!<cr>")

-- nvim tree
map("in", "<c-b>", "<cmd>NvimTreeFindFileToggle<cr>")
-- telescope
map("ni", "<c-r>", "<cmd>Telescope project<cr>")
map("ni", "<c-p>", "<cmd>Telescope find_files<cr>")
map("ni", "<c-f>", "<cmd>Telescope live_grep<cr>")	-- search for a string
-- buffer line
-- map("n", "db", ":bd<cr>")
map("ni", "<c-tab>", "<esc>:BufferLineCycleNext<cr>")
map("ni", "<s-tab>", "<esc>:BufferLineCyclePrev<cr>")

-- logic line and view line
-- map("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
-- map("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })


-- map({ 'n', 'i' }, [[<c-s-p>]], '<esc>:')
