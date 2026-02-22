return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Se charge juste avant l'écriture du fichier
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			cpp = { "clang-format" },
			c = { "clang-format" },
		},
		-- La partie magique : le formatage à l'enregistrement
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback", -- Si clang-format n'est pas là, il essaie le LSP
		},
	},
}
