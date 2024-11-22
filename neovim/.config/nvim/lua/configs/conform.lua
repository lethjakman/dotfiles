local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    -- html = { "prettier" },
    python = { "ruff_format", "ruff_organize_imports", "ruff_fix", "typos_lsp" },
    terraform = { "terraform_fmt", "typos_lsp" },
    go = { "gofmt", "goimports", "typos_lsp" },
    markdown = { "prettier", "textlsp" },
    sql = { "sqlfluff" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2500,
    lsp_fallback = true,
  },
}

return options
