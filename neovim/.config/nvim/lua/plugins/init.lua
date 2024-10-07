return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Do I need this anymore?
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     -- ensure_installed = {
  --     --   -- lua stuff
  --     --   "lua-language-server",
  --     --   "stylua",
  --     --
  --     --   -- web dev stuff
  --     --   "css-lsp",
  --     --   "html-lsp",
  --     --   "typescript-language-server",
  --     --   "deno",
  --     --   "prettier",
  --     --
  --     --   -- c/cpp stuff
  --     --   "clangd",
  --     --   "clang-format",
  --     --
  --     --   -- rust
  --     --   "rust-analyzer",
  --     --
  --     --   -- python
  --     --   "pyright",
  --     --   "ruff-lsp",
  --     --   "ruff",
  --     --
  --     --   "gopls",
  --     --   "golangci-lint",
  --     --   "golangci-lint-langserver",
  --     --
  --     --   -- terraform
  --     --   "terraform-ls",
  --     --
  --     --   -- config
  --     --   "yaml-language-server",
  --     --   "json-lsp",
  --     -- },
  --   },
  -- },

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

        -- infra
        "terraform",
      },

      sync_install = true,
      auto_install = true,
    },
  },
}
