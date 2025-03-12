-- local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  "NvChad/nvcommunity",
  -- { import = 'nvcommunity.git.lazygit' },
  -- { import = 'nvcommunity.lsp.mason-lspconfig' },
  { import = "nvcommunity.motion.hop" },
  { import = "nvcommunity.file-explorer.oil-nvim" },
  { import = "nvcommunity.lsp.prettyhover" },
  { import = "nvcommunity.lsp.lspsaga" },

  -- override plugin configs

  -- Install a plugin
  -- {
  --   "stevearc/conform.nvim",
  --   event = "BufWritePre", -- uncomment for format on save
  --   lazy = false,
  --   config = function()
  --     require "configs.conform"
  --   end,
  -- },
  -- {
  --   "max397574/better-escape.nvim",
  --   event = "InsertEnter",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- },

  {
    "ggandor/leap.nvim",
    -- opts = overrides.leap,
    lazy = false,
    config = function()
      -- require("leap").create_default_mappings()
    end,
    enabled = true,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    enabled = true,
    keys = {
      { "<leader>gg", "<cmd>:LazyGit<cr>", desc = "LazyGit" },
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    ft = { "norg" },
    -- put any other flags you wanted to pass to lazy here!
    config = function()
      require("neorg").setup {
        -- put any of your previous config here
      }
    end,
  },
  {
    "polarmutex/git-worktree.nvim",
    version = "^2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "git_worktree"
      local Hooks = require "git-worktree.hooks"

      Hooks.register(Hooks.type.SWITCH, Hooks.builtins.update_current_buffer_on_switch)
    end,
    keys = {
      {
        "<leader>gw",
        "<CMD>lua require('telescope').extensions.git_worktree.git_worktree()<cr>",
        "Select git worktrees",
      },
      {
        "<leader>gn",
        "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
        "Create new git worktree",
      },
    },
  },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  {
    "nvim-neotest/neotest",
    ft = { "go", "python" },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            dap = { justMyCode = false },
          },
          require "neotest-golang",
          require "neotest-plenary",
          require "neotest-vim-test" {
            ignore_file_types = { "python", "vim", "lua" },
          },
        },
      }
    end,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-python",
      "fredrikaverpil/neotest-golang",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-vim-test",
    },
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>tx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  {
    "allaman/emoji.nvim",
    version = "1.0.0", -- optionally pin to a tag
    ft = { "norg", "markdown" }, -- adjust to your needs
    dependencies = {
      -- util for handling paths
      "nvim-lua/plenary.nvim",
      -- optional for nvim-cmp integration
      "hrsh7th/nvim-cmp",
      -- optional for telescope integration
      "nvim-telescope/telescope.nvim",
      -- optional for fzf-lua integration via vim.ui.select
      "ibhagwan/fzf-lua",
    },
    opts = {
      -- default is false, also needed for blink.cmp integration!
      enable_cmp_integration = true,
      -- optional if your plugin installation directory
      -- is not vim.fn.stdpath("data") .. "/lazy/
      -- plugin_path = vim.fn.expand "$HOME/plugins/",
    },
    config = function(_, opts)
      require("emoji").setup(opts)
      -- optional for telescope integration
      local ts = require("telescope").load_extension "emoji"
      vim.keymap.set("n", "<leader>se", ts.emoji, { desc = "[S]earch [E]moji" })
    end,
  },
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
      -- your configuration comes here
      global_keymaps = false,
    },
  },
}

return plugins
