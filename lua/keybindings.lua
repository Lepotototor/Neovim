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
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})

-- linting and formatting keybinds
vim.keymap.set("n", "cg", vim.lsp.buf.format, {})

-- debugger keybinds
vim.keymap.set('n', 'dt', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', 'dc', function() require('dap').continue() end)

-- toggle terminal
vim.keymap.set('n', '<C-x>', '<CMD>lua require("FTerm").toggle()<CR>')
