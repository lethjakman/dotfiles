local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    -- html = { "prettier" },
    python = { "ruff_format", "ruff_organize_imports", "ruff_fix" },
    terraform = { "terraform_fmt" },
    go = { "gofmt", "goimports" },
    markdown = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
