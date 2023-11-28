vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.o
set.number = true
set.numberwidth = 4
set.relativenumber = true

set.swapfile = false

set.wrap = false

set.signcolumn = "yes:1"
set.autoread = true
set.mouse = "a"
set.hlsearch = true
set.encoding = "utf8"
set.clipboard = "unnamedplus"
set.smartcase = true
set.autoindent = true
set.smartindent = true
set.shiftwidth = 4
set.tabstop = 4
set.termguicolors = true
set.ignorecase = true

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
