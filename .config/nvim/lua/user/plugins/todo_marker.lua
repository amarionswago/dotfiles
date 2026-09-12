return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = function(bufnr)
			local ft = vim.bo[bufnr].filetype
			if vim.tbl_contains({}, ft) then
				return { timeout_ms = 2000, lsp_format = "fallback" }
			end
		end,
	},
}
