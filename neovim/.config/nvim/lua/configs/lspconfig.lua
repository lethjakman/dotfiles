-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = {
  "html",
  "cssls",
  "bashls",
  "gopls",
  "golangci_lint_ls",
  "basedpyright",
  "terraformls",
  "tflint",
  "jsonls",
  "ruff",
  "rust_analyzer",
  "bashls",
  "marksman",
  "ansiblels",
  "yamlls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.textlsp.setup {
  filetypes = { "tex", "text", "markdown", "typst", "org" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    textLSP = {
      analysers = {
        languagetool = {
          enabled = false,
          check_text = { on_open = true, on_save = true, on_change = false },
        },
        ollama = {
          enabled = true,
          check_text = {
            on_open = true,
            on_save = true,
            on_change = false,
          },
          model = "phi3:3.8b-instruct", -- smaller but faster model
          -- model = "phi3:14b-instruct",  -- more accurate
          max_token = 50,
        },
      },
    },
  },
}
