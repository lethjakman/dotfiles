-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "html",
  "cssls",
  "bashls",
  "gopls",
  "basedpyright",
  -- "pyright",
  "terraformls",
  "tflint",
  "jsonls",
  "ruff",
  "rust_analyzer",
  "bashls",
  "marksman",
  "ansiblels",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
