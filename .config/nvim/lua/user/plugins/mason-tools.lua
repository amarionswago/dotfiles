return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	opts = {
		ensure_installed = {
			"codelldb",
			"taplo",
		},
		run_on_start = false,
	},
}
