vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local set = vim.o
set.number = true
set.numberwidth = 4
set.relativenumber = true

set.swapfile = false

set.wrap = false
set.scrolloff = 5
set.sidescroll = 5

set.signcolumn = "yes:1"
set.autoread = true
set.mouse = "a"
set.hlsearch = true
set.encoding = "utf-8"
set.fileencoding = "uft-8"

set.clipboard = "unnamedplus"
set.smartcase = true
set.autoindent = true
set.smartindent = true
set.shiftwidth = 4
set.tabstop = 4
set.termguicolors = true
set.ignorecase = true

set.foldcolumn = "1"
set.foldlevel = 99
set.foldlevelstart = 99
set.foldenable = true
set.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.o.guifont = "Hack Nerd Font:h16"

-- high light code when copy trigger
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({ timeout = 500, })
	end,
})

-- config for neovide
if vim.g.neovide then
	vim.g.neovide_input_macos_alt_is_meta = false
end
