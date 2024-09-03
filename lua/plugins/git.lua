return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<space>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<space>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
	{
		"tpope/vim-fugitive",
	},
}
