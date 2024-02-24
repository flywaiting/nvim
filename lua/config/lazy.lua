local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)	-- add to runtime path

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	install = {
		-- colorscheme = { "nordfox" },
	},
	custom_keys = {
		["<c-s-p>"] = {
			"<esc>:<cr>",
			mode = { "i", "n" },
			desc = "command",
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				-- "tarPlugin",
				-- "zipPlugin",
				-- "tohtml",
				-- "tutor",
			},
		},
	},
})
