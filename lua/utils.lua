local opt = { silent = true, noremap = true }

local function map(mode, lhs, rhs)
	for c in mode:gmatch(".") do
		vim.api.nvim_set_keymap(c, lhs, rhs, opt)
		-- vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
	end
end

local function altKey(key)
	if (vim.fn.has("macunix")) then
		return "<m-"..key..">"
	else
		return "<a-"..key..">"
	end
end

return {
	map = map,
	altKey = altKey,
}
