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
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.pick").setup()
      -- Shouldn't need this but I do for some reason
      vim.ui.select = require("mini.pick").ui_select
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  "NvChad/nvcommunity",
  { import = "nvcommunity.motion.hop" },
  { import = "nvcommunity.file-explorer.oil-nvim" },
  { import = "nvcommunity.lsp.prettyhover" },
  { import = "nvcommunity.lsp.lspsaga" },

  -- override plugin configs

  -- Install a plugin

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
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
    init = function()
      -- Configure rustaceanvim here
      vim.g.rustaceanvim = {}
    end,
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
        desc = "Select git worktrees",
      },
      {
        "<leader>gn",
        "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
        desc = "Create new git worktree",
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
    keys = {
      -- Test running
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Run current file tests",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.run(vim.fn.getcwd())
        end,
        desc = "Run all tests",
      },
      {
        "<leader>tr",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last test",
      },
      {
        "<leader>tk",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop test",
      },

      -- Debug tests (requires nvim-dap)
      {
        "<leader>td",
        function()
          require("neotest").run.run { strategy = "dap" }
        end,
        desc = "Debug nearest test",
      },
      {
        "<leader>tD",
        function()
          require("neotest").run.run { vim.fn.expand "%", strategy = "dap" }
        end,
        desc = "Debug current file tests",
      },

      -- Test UI
      {
        "<leader>to",
        function()
          require("neotest").output.open { enter = true, auto_close = true }
        end,
        desc = "Open test output",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle output panel",
      },
      {
        "<leader>tt",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle test summary",
      },

      -- Navigation
      {
        "]t",
        function()
          require("neotest").jump.next { status = "failed" }
        end,
        desc = "Jump to next failed test",
      },
      {
        "[t",
        function()
          require("neotest").jump.prev { status = "failed" }
        end,
        desc = "Jump to prev failed test",
      },

      -- Watch mode
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle()
        end,
        desc = "Toggle watch mode",
      },
      {
        "<leader>tW",
        function()
          require("neotest").watch.toggle(vim.fn.expand "%")
        end,
        desc = "Toggle watch current file",
      },

      -- Marks (for running specific tests)
      {
        "<leader>tm",
        function()
          require("neotest").run.run { suite = false, extra_args = { "--verbose" } }
        end,
        desc = "Run marked tests",
      },
    },
  },
  {
    "folke/trouble.nvim",
    -- lazy = false,
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
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tl",
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
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "fasterius/simple-zoom.nvim",
    config = true,
    keys = {
      { "<leader>z", ":SimpleZoomToggle<CR>", desc = "toggle zoom" },
    },
  },
  {
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("gitlinker").setup {
        callbacks = {
          -- ["github.com"] = require"gitlinker.hosts".get_github_type_url,
          -- ["gitlab.com"] = require"gitlinker.hosts".get_gitlab_type_url,
          -- ["try.gitea.io"] = require"gitlinker.hosts".get_gitea_type_url,
          -- ["codeberg.org"] = require"gitlinker.hosts".get_gitea_type_url,
          -- ["bitbucket.org"] = require"gitlinker.hosts".get_bitbucket_type_url,
          -- ["try.gogs.io"] = require"gitlinker.hosts".get_gogs_type_url,
          -- ["git.sr.ht"] = require"gitlinker.hosts".get_srht_type_url,
          -- ["git.launchpad.net"] = require"gitlinker.hosts".get_launchpad_type_url,
          -- ["repo.or.cz"] = require"gitlinker.hosts".get_repoorcz_type_url,
          -- ["git.kernel.org"] = require"gitlinker.hosts".get_cgit_type_url,
          -- ["git.savannah.gnu.org"] = require"gitlinker.hosts".get_cgit_type_url
        },
        -- Optional: Add your custom configuration options here
        -- For example, to set a default remote:
        -- default_remote = "origin",
      }
    end,
  },
  {
    "stevearc/overseer.nvim",
    opts = {},
    -- dependencies = { "nvim-telescope/telescope.nvim", "folke/snacks.nvim" },
    dependencies = { "nvim-telescope/telescope.nvim", "echasnovski/mini.nvim" },
    keys = {
      -- Basic task management
      { "<leader>oo", "<cmd>OverseerToggle<cr>", desc = "Toggle Overseer" },
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Quick action" },
      { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },

      -- Task building and templates
      { "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Build task" },
      { "<leader>ot", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },

      -- Task bundles (saved task collections)
      { "<leader>os", "<cmd>OverseerSaveBundle<cr>", desc = "Save task bundle" },
      { "<leader>ol", "<cmd>OverseerLoadBundle<cr>", desc = "Load task bundle" },
      { "<leader>od", "<cmd>OverseerDeleteBundle<cr>", desc = "Delete task bundle" },
    },
    config = function()
      require("overseer").setup {
        task_list = {
          bindings = {
            ["?"] = "ShowHelp",
            ["g?"] = "ShowHelp",
            ["<CR>"] = "RunAction",
            ["<C-e>"] = "Edit",
            ["o"] = "Open",
            ["<C-v>"] = "OpenVsplit",
            ["<C-s>"] = "OpenSplit",
            ["<C-f>"] = "OpenFloat",
            ["<C-q>"] = "OpenQuickFix",
            ["p"] = "TogglePreview",
            ["L"] = "IncreaseAllDetail",
            ["H"] = "DecreaseAllDetail",
            ["["] = "DecreaseWidth",
            ["]"] = "IncreaseWidth",
            ["{"] = "PrevTask",
            ["}"] = "NextTask",
            ["<M-l>"] = "IncreaseDetail",
            ["<M-h>"] = "DecreaseDetail",
            ["<M-k>"] = "ScrollOutputUp",
            ["<M-j>"] = "ScrollOutputDown",
            -- ["<C-l>"] = "IncreaseDetail",
            -- ["<C-h>"] = "DecreaseDetail",
            -- ["<C-k>"] = "ScrollOutputUp",
            -- ["<C-j>"] = "ScrollOutputDown",
            ["q"] = "Close",
          },
        },
      }
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      -- bigfile = { enabled = true },
      -- dashboard = { enabled = true },
      -- explorer = { enabled = true },
      -- indent = { enabled = true },
      -- input = { enabled = true },
      -- picker = { enabled = true },
      -- notifier = { enabled = true },
      -- quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      { "<leader>lt", "<cmd>Trouble todo<cr>", desc = "Trouble TODO" },
      { "<leader>lT", "<cmd>TodoTelescope<cr>", desc = "Telescope TODO" },
    },
  },
  {
    "benfowler/telescope-luasnip.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "luasnip"
    end,
    keys = {
      { "<leader>fs", "<cmd>Telescope luasnip<cr>", desc = "telescope luasnip" },
    },
  },
}
