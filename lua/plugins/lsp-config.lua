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
          "lua_ls",
          "csharp_ls",
          "ocamllsp",
          "pylsp",
          "ltex",
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

      lspconfig.ocamllsp.setup({
        capabilities = capabilities,
      })

      lspconfig.csharp_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      -- lspconfig.omnisharp.setup({
      --   cmd = {
      --     "mono",
      --     "--assembly-loader=strict",
      --     "/home/lepotototor/.config/nvim/omnisharp/" .. "/omnisharp/OmniSharp.exe",
      --   },
      --   use_mono = true,
      -- })
    end,
  },
}
