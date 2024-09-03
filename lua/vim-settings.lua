-- Activer les numéros de ligne
vim.o.number = true

-- Activer la ligne du curseur
vim.o.cursorline = true

-- Activer la détection automatique du type de fichier
vim.cmd('filetype on')

-- Activer la coloration syntaxique
vim.cmd('syntax on')

-- Activer l'auto-indentation
vim.o.autoindent = true


-- Configuration pour indentation de 2 espaces lors de l'utilisation de la touche Tab
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Configuration pour afficher l'indentation comme 2 espaces
vim.o.softtabstop = 2

