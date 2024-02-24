vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local set = vim.opt
set.number = true
set.numberwidth = 4
set.relativenumber = true

set.swapfile = false

set.wrap = false
set.scrolloff = 8
set.sidescroll = 8

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

set.foldlevel = 99
set.foldlevelstart = 99
set.foldenable = true
-- set.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

set.laststatus = 3

vim.opt.guifont = "Hack Nerd Font:h16"

-- high light code when copy trigger
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({ timeout = 500, })
	end,
})

-- config for neovide
if vim.g.neovide then
	vim.g.neovide_input_macos_alt_is_meta = true
end
