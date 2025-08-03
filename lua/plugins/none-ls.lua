return {
  "nvimtools/none-ls.nvim",
  "jose-elias-alvarez/null-ls.nvim",

  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.ocamlformat,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.bib,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.biome,
        null_ls.builtins.formatting.prettierd,

        null_ls.builtins.diagnostics.vale,
        null_ls.builtins.diagnostics.cpplint,
        null_ls.builtins.diagnostics.stylelint,
      },
    })
  end,
}
