return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      -- ensure_installed = {
      --   -- lua stuff
      --   "lua-language-server",
      --   "stylua",
      --
      --   -- web dev stuff
      --   "css-lsp",
      --   "html-lsp",
      --   "typescript-language-server",
      --   "deno",
      --   "prettier",
      --
      --   -- c/cpp stuff
      --   "clangd",
      --   "clang-format",
      --
      --   -- rust
      --   "rust-analyzer",
      --
      --   -- python
      --   "pyright",
      --   "ruff-lsp",
      --   "ruff",
      --
      --   "gopls",
      --   "golangci-lint",
      --   "golangci-lint-langserver",
      --
      --   -- terraform
      --   "terraform-ls",
      --
      --   -- config
      --   "yaml-language-server",
      --   "json-lsp",
      -- },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Editor
        "vim",
        "lua",
        "vimdoc",

        -- Config
        "markdown",
        "markdown_inline",
        "yaml",

        -- rust
        "rust",

        -- python
        "python",

        -- go
        "go",
        "gomod",
        "gosum",

        -- haskell
        "haskell",

        -- ruby
        "ruby",

        -- web
        "http",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        --
        -- General
        "tsx",
        "c",

        -- Git
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",

        -- build
        "make",
        "just",

        -- norg mode
        "norg",

        -- sql
        "sql",
      },
    },
  },
}
