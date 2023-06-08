vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.swapfile = false

local set = vim.o
set.number = true
set.numberwidth = 4
set.signcolumn = "yes:1"
set.relativenumber = true
set.autoread = true
set.mouse = "a"
set.hlsearch = true
set.encoding = "utf8"
set.clipboard = "unnamed"
set.smartcase = true
set.autoindent = true
set.smartindent = true
set.shiftwidth = 4
set.tabstop = 4
set.termguicolors = true
set.ignorecase = true

-- high light code when copy trigger
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({ timeout = 500, })
	end,
})
