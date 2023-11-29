-- 感觉没什么用 每次都得手动调整
return {
	{
		"anuvyklack/windows.nvim",
		event = "BufEnter",
		enabled = false,
		dependencies = {
			"anuvyklack/middleclass",
		},
		config = function()
			require("windows").setup()
		end,
	},
}
