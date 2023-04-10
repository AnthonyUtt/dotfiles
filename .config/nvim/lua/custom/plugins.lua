local plugins = {
  {
    "Exafunction/codeium.vim",
    config = function()
      vim.keymap.set('i', '<C-v>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.g.codeium_no_map_tab = true
      -- vim.g.codeium_enabled = false
    end,
    cmd = "Codeium",
    event = "VimEnter",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require "custom.configs.rust_tools"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "css-lsp",
        "cssmodules-language-server",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "dot-language-server",
        "emmet-ls",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "prettier",
        "rust-analyzer",
        "solargraph",
        "sqlls",
        "typescript-language-server",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "cmake",
        "cpp",
        "css",
        "dockerfile",
        "dot",
        "hlsl",
        "html",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "kdl",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "regex",
        "ruby",
        "rust",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "wgsl",
        "yaml",
        "yuck",
      },
    },
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup()
    end,
  },
  {
    "kamykn/spelunker.vim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.g.enable_spelunker_vim = 1
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function(_, opts)
      require('nvim-ts-autotag').setup(opts)
      vim.cmd "TSEnable autotag"
    end,
  },
}

return plugins
