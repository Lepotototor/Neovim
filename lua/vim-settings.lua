-- Activer les numéros de ligne
vim.o.number = true

-- Activer la ligne du curseur
vim.o.cursorline = true

-- Activer la détection automatique du type de fichier
vim.cmd('filetype on')

-- Activer la coloration syntaxique
vim.cmd('syntax on')
vim.opt.termguicolors = true
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true }, })
vim.cmd.colorscheme("rose-pine-moon")

-- Activer l'auto-indentation
-- vim.o.autoindent = true


vim.o.tabstop = 4       -- Un caractère TAB ressemble à 4 espaces
vim.o.softtabstop = 4   -- Nombre d'espaces insérés à la place d'un caractère TAB
vim.o.shiftwidth = 4    -- Nombre d'espaces insérés lors de l'indentation
vim.o.expandtab = false -- Appuyer sur la touche TAB insérera des espaces au lieu d'un caractère TAB
vim.opt.cindent = true  -- override indent en c

-- s'assurer que pour les buffers C/C++ les options sont bien appliquées (buffer-local)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cc", "cpp", "objc", "h", "hh", "hpp", "hxx" },
	callback = function(args)
		local b = vim.bo[args.buf]
		b.tabstop = 4
		b.shiftwidth = 4
		b.softtabstop = 4
		b.expandtab = true
		b.cindent = true
	end,
})

vim.filetype.add({
	extension = {
		l = 'lex',
		lex = 'lex',
		y = 'yacc',
		yacc = 'yacc',
	},
})
