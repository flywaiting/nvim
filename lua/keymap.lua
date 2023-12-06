local map = require("utils").map

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("in", "<s-enter>", "<esc>O")	-- new line above 
map("in", "<a-enter>", "<esc>A")	-- end of line
map("in", "<c-enter>", "<esc>o")	-- new line below
map("in", "<c-bs>", "<esc>ciw")		-- del cursor word and insert

-- map("n", "<c-s>", ":w<cr>")
map("in", "<c-s>", "<esc>:w<cr>")
map("i", "<c-v>", '<esc>"+pa')
map("i", "<c-x>", "<esc>ddA")

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
-- map("n", "qq", ":bd<cr>")
map("in", "<a-w>", "<esc>:bd<cr>")
map("n", "Q", ":qa!<cr>")

-- < and >, for indent, with motion, like d,y so on

-- comment
map("in", "<c-/>", "<cmd>CommentToggle<cr>")
map("v", "<c-/>", ":CommentToggle<cr>")
-- move
map("in", "<a-j>", "<cmd>MoveLine 1<cr>")
map("in", "<a-k>", "<cmd>MoveLine -1<cr>")
map("in", "<a-h>", "<cmd>MoveWord -1<cr>")
map("in", "<a-l>", "<cmd>MoveWord 1<cr>")
map("v", "<a-j>", ":MoveBlock 1<cr>")
map("v", "<a-k>", ":MoveBlock -1<cr>")
-- nvim tree
-- map("in", "<c-b>", "<cmd>NvimTreeFindFileToggle<cr>")
-- telescope
map("ni", "<c-r>", "<cmd>Telescope project<cr>")
map("ni", "<c-p>", "<cmd>Telescope find_files<cr>")
map("ni", "<c-f>", "<cmd>Telescope live_grep<cr>")	-- search for a string
map("ni", "<c-b>", "<cmd>Telescope file_browser path=%:p:h<cr>")	-- file browser
-- buffer line
-- map("n", "db", ":bd<cr>")
map("ni", "<c-tab>", "<esc>:BufferLineCycleNext<cr>")
map("ni", "<s-tab>", "<esc>:BufferLineCyclePrev<cr>")

-- logic line and view line
-- map("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
-- map("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })


-- map({ 'n', 'i' }, [[<c-s-p>]], '<esc>:')
