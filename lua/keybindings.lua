vim.cmd("nnoremap <Left> :echo  'No left for you! '<CR>")
vim.cmd("inoremap <Left> <C-o>:echo  'No left for you! '<CR>")

vim.cmd("nnoremap <Right> :echo  'No right for you! '<CR>")
vim.cmd("inoremap <Right> <C-o>:echo  'No right for you! '<CR>")

vim.cmd("nnoremap <Up> :echo  'No up for you! '<CR>")
vim.cmd("inoremap <Up> <C-o>:echo  'No up for you! '<CR>")

vim.cmd("nnoremap <Down> :echo  'No down for you! '<CR>")
vim.cmd("inoremap <Down> <C-o>:echo  'No down for you! '<CR>")

vim.keymap.set("n", "<C-n>", ":Neotree toggle <CR>", {})

-- lsp keybinds
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- À ajouter dans ta config LSP
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP Signature Help" })
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<M-CR>", vim.lsp.buf.code_action, {})

-- Clangs extension
vim.keymap.set("n", "<leader>ss", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C++)" })
-- Toggle les indices visuels (Inlay Hints)
vim.keymap.set("n", "F", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

-- Voir les infos détaillées du symbole (type réel, taille en mémoire, etc.)
vim.keymap.set("n", "<leader>cq", "<cmd>ClangdSymbolInfo<cr>", { desc = "C++ Symbol Info" })
-- Afficher l'arbre AST (Abstract Syntax Tree) du bloc sous le curseur
vim.keymap.set("n", "<leader>cw", "<cmd>ClangdAST<cr>", { desc = "C++ View AST" })
-- Afficher la hiérarchie de type (héritage)
vim.keymap.set("n", "<leader>ce", "<cmd>ClangdTypeHierarchy<cr>", { desc = "C++ Type Hierarchy" })

vim.keymap.set({ "n", "i" }, "<M-;>", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>A;<Esc>", true, false, true), "n", false)
end, { desc = "Ajouter ; en fin de ligne et sauter" })


-- linting and formatting keybinds
vim.keymap.set("n", "<space>gg", vim.lsp.buf.format, {})
-- vim.keymap.set("n", "<space>cd", vim.lsp.buf.linting, {})

-- debugger keybinds
vim.keymap.set('n', 'dt', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', 'dc', function() require('dap').continue() end)
