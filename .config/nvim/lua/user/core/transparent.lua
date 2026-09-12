local M = {}

local transparent_groups = {
	"Normal",
	"NormalNC",
	"SignColumn",
	"FoldColumn",
	"EndOfBuffer",
	"LineNr",
	"LineNrAbove",
	"LineNrBelow",
	"NonText",
}

local function apply()
	for _, group in ipairs(transparent_groups) do
		vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
	end
end

function M.setup()
	local group = vim.api.nvim_create_augroup("PersonalTransparentBackground", { clear = true })

	vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter", "UIEnter" }, {
		group = group,
		callback = function()
			vim.schedule(apply)
		end,
	})

	apply()
end

return M
