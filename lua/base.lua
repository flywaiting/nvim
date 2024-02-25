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

set.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- if vim.fn.has("nvim-0.10") == 1 then
-- 	set.smoothscroll = true
-- end

-- set.foldlevel = 99
-- set.foldtext = "v:lua.require'config.util'.foldtext()"

-- if vim.fn.has("nvim-0.9.0") == 1 then
-- 	vim.opt.statuscolumn = [[%!v:lua.require'config.util'.statuscolumn()]]
-- end

-- -- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
-- if vim.fn.has("nvim-0.10") == 1 then
-- 	vim.opt.foldmethod = "expr"
-- 	vim.opt.foldexpr = "v:lua.require'config.util'.foldexpr()"
-- else
-- 	vim.opt.foldmethod = "indent"
-- end

-- set.foldlevelstart = 99
-- set.foldenable = true

set.laststatus = 3

vim.opt.guifont = "Hack Nerd Font:h16"

-- config for neovide
if vim.g.neovide then
	vim.g.neovide_input_macos_alt_is_meta = true
end
