local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

-- autres setups déjà existants...
-- ...

-- jdtls via nvim-jdtls (meilleure intégration pour Java)
local has_jdtls, jdtls = pcall(require, "jdtls")
if has_jdtls then
  -- Fonction utilitaire pour config par projet
  local function make_jdtls_config()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.stdpath("data") .. "/site/java-workspace/" .. project_name

    -- Trouve le root: gradle, git, ou autres marqueurs
    local root_dir = require("jdtls.setup").find_root({ ".git", "build.gradle", "settings.gradle", "pom.xml" })
    if not root_dir then
      root_dir = vim.fn.getcwd()
    end

    -- Mason installe jdtls ; on récupère le bon chemin automatiquement
    local config = {
      cmd = jdtls.start_or_attach_cmd() or {}, -- laisse nvim-jdtls gérer la résolution du jar et du config
      root_dir = root_dir,
      capabilities = capabilities,
      settings = {
        java = {
          eclipse = { downloadSources = true },
          configuration = { updateBuildConfiguration = "interactive" },
          maven = { downloadSources = true },
          implementationsCodeLens = { enabled = true },
          referencesCodeLens = { enabled = true },
          inlayHints = { enabled = true },
        },
      },
      init_options = {
        bundles = {}, -- tu peux y ajouter des bundles pour debug plus tard
      },
      -- workspace data
      workspace_dir = workspace_dir,
    }
    return config
  end

  -- Auto-start/attach quand on ouvre un Java
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
      local config = make_jdtls_config()
      jdtls.start_or_attach(config)
    end,
  })
else
  vim.notify("nvim-jdtls non installé : installer 'mfussenegger/nvim-jdtls'", vim.log.levels.WARN)
end
