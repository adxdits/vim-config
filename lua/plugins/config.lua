return {
  {
    "LazyVim/LazyVim",
  },

  {
    "saghen/blink.cmp",
    version = "0.12.*",
    opts = function(_, opts)
      opts.cmdline = opts.cmdline or {}
      opts.cmdline.sources = opts.sources.cmdline or {}
      opts.sources.cmdline = nil
    end,
  },

  { "williamboman/mason-lspconfig.nvim", version = "1.*" },

  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },

  { "folke/trouble.nvim", enabled = false },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "bottom" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    opts = {
      servers = {
        tsserver = {},
        zls = { mason = false },
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },

  { import = "lazyvim.plugins.extras.lang.typescript" },

  { import = "lazyvim.plugins.extras.lang.zig" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
        "zig",
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {}
    end,
  },

  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  { import = "lazyvim.plugins.extras.lang.json" },

  {
    "williamboman/mason.nvim",
    version = "1.*",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "left",
        width = 32,
        mappings = {
          ["<2-LeftMouse>"] = "open",
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_default",
        follow_current_file = { enabled = true },
      },
    },
  },
  {
    "nkxxll/ghostty-default-style-dark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("ghostty-default-style-dark").setup({})
      vim.cmd.colorscheme("ghostty-default-style-dark")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "tab",
    },
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle full terminal" },
    },
  },
}
