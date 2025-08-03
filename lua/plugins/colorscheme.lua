themes = {
  "rose-pine-dawn",
  "catppuccin-latte",
  "retrobox",
  "peachpuff",
  "catppuccin-frappe",
  "rose-pine-moon",
  "everforest",
  "rose-pine",
  "evening",
  "catppuccin-macchiato",
  "unokai",
  "catppuccin-mocha"
}
current = 1
nb_themes = #themes

function ChangeTheme()
  vim.cmd.colorscheme(themes[current])
  print("New theme is: " .. themes[current])
end

function IncrementTheme()
  current = current % nb_themes + 1
  ChangeTheme()
end

function DecrementTheme()
  current = current - 1
  if current == 0 then
    current = nb_themes
  end
  ChangeTheme()
end

return {
  "rose-pine/neovim",
  "catppuccin/nvim",
  "neanias/everforest-nvim",

  vim.api.nvim_create_user_command("IncrementTheme", IncrementTheme, {}),
  vim.api.nvim_create_user_command("DecrementTheme", DecrementTheme, {}),

  vim.keymap.set("n", "<C-.>", ":IncrementTheme <CR>", {}),
  vim.keymap.set("n", "<C-,>", ":DecrementTheme <CR>", {}),

  config = function()
    vim.cmd.colorscheme("rose-pine-dawn")
  end,
}
