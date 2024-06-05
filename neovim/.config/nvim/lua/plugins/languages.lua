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
      ensure_installed = {
        -- Editor
        "lua-language-server", "stylua",
        -- web dev
        "html-lsp", "css-lsp" , "prettier",
        -- General Languages
        "gopls",
        "rust-analyzer",
        "pyright"
      },
    },
  },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
        -- Editor
  			"vim", "lua", "vimdoc",
        -- web dev
       "html", "css",

        -- General languages
        "rust",
        "python"
  		},
  	},
  },
}
