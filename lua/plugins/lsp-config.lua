return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = { auto_install = true },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"p00f/clangd_extensions.nvim",
			"ray-x/lsp_signature.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config('lua_ls', { capabilities = capabilities })
			vim.lsp.config('pylsp', { capabilities = capabilities })
			vim.lsp.config('somesass_ls', { capabilities = capabilities })
			vim.lsp.config('biome', {
				capabilities = capabilities,
				cmd = { 'biome', 'lsp-proxy' },
				root_dir = vim.fs.root(0, { 'biome.json', 'biome.jsonc' }),
			})
			vim.lsp.config('clangd', {
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--header-insertion=never",
					"--header-insertion-decorators=0",
					"--completion-style=detailed",
				},
			})

			vim.lsp.enable('lua_ls')
			vim.lsp.enable('pylsp')
			vim.lsp.enable('somesass_ls')
			vim.lsp.enable('biome')
			vim.lsp.enable('clangd')

			require("clangd_extensions").setup({
				inlay_hints = {
					inline = true,
					only_current_line = false,
					show_parameter_hints = true,
					parameter_hints_prefix = "<- ",
					other_hints_prefix = "=> ",
				},
			})
			vim.lsp.inlay_hint.enable(true)

			require("lsp_signature").setup({
				bind = true,
				handler_opts = { border = "rounded" },
				hint_enable = true,
				hi_parameter = "LspSignatureActiveParameter",
			})
		end,
	},
}
