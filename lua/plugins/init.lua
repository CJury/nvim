return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "danymat/neogen",
    event = "VeryLazy",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      sync_root_with_cwd = true,
      view = {
        width = {
          min = 30,
          max = 30,
        },
      },
      filters = {
        git_ignored = false,
      },
    },
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "Zeioth/dooku.nvim",
    event = "VeryLazy",
    opts = {
      -- your config options here
    },
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      print("Loading luasnip")
      require "configs.luasnip"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp" , "prettier", "clangd", "cmake-language-server"
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
       "html", "css"
      },
    },
  },
  {
    'tikhomirov/vim-glsl',
    event = "BufReadPre",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "julianolf/nvim-dap-lldb"},
    cmd = { "DapNew" },
    config = function()
      require("dapui").setup()
      vim.keymap.set("n", "<Leader>dt", ":lua require(\"dapui\").toggle()<CR>")
      vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
      vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>")
    end
  },
  {
    "julianolf/nvim-dap-lldb",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-lldb").setup()
    end
  }
}
