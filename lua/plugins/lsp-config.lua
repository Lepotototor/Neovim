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
          "lua_ls",
          -- "asm-lsp",
          "clangd",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })

      lspconfig.somesass_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.biome.setup({
        capabilities = capabilities,
        cmd = { 'biome', 'lsp-proxy' },
        root_dir = lspconfig.util.root_pattern('biome.json', 'biome.jsonc'),
        single_file_support = false,
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd", "--header-insertion=never", "--header-insertion-decorators=0" },
        init_options = {
          -- compilationDatabasePath = "/path/to/compile_commands.json",
          fallbackFlags = { "-I/usr/include/gtk-3.0" },
        },
      })

          end,
  },
}
