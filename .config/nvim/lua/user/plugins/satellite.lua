return {
	"lewis6991/satellite.nvim",
	opts = {
		current_only = true,
		winblend = 80,
		handlers = {
			cursor = {
				enable = true,
			},
			diagnostic = {
				enable = true,
				min_severity = vim.diagnostic.severity.ERROR,
			},
			search = {
				enable = false,
			},
			gitsigns = {
				enable = false,
			},
			marks = {
				enable = false,
			},
		},
	},
}
