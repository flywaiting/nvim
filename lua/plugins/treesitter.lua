return{
	"nvim-treesitter/nvim-treesitter",
	event = "BufRead",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
	config = function ()
		require("nvim-treesitter.configs").setup({
			sync_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			}
		})
	end
}
