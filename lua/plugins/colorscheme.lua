themes = {
  "rose-pine-dawn",
  "everforest-light-soft",
  "everforest-light-medium",
  "everforest-light-hard",
  "everforest-dark-medium",
  "catppuccin-latte",
  "gruvbox-material",
  "retrobox",
  "peachpuff",
  "catppuccin-frappe",
  "rose-pine-moon",
  "rose-pine",
  "evening",
  "catppuccin-macchiato",
  "unokai",
  "catppuccin-mocha"
}
current = 1
nb_themes = #themes

function ChangeTheme()
  theme = themes[current]

  -- 🎨 Traitement spécial Everforest
  if theme:match("^everforest") then
    local bg, contrast = theme:match("^[^-]+%-([^-]+)%-([^-]+)$")

    vim.o.background = bg
    package.loaded["everforest"] = nil

    require("everforest").setup({
      background = contrast,
      contrast = contrast,
      transparent_background_level = 0,
      italics = true,
    })

    vim.cmd.colorscheme("default")
    vim.cmd.colorscheme("everforest")
    vim.notify("🌲 Theme: " .. theme)
    return
  end

  vim.cmd.colorscheme(theme)
  print("👨‍❤️‍💋‍👨 New theme is: " .. themes[current])
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
  "sainnhe/gruvbox-material",

  vim.api.nvim_create_user_command("IncrementTheme", IncrementTheme, {}),
  vim.api.nvim_create_user_command("DecrementTheme", DecrementTheme, {}),

  vim.keymap.set("n", "<C-.>", ":IncrementTheme <CR>", {}),
  vim.keymap.set("n", "<C-,>", ":DecrementTheme <CR>", {}),

  config = function()
    vim.cmd.colorscheme("rose-pine-dawn")
  end,
}
