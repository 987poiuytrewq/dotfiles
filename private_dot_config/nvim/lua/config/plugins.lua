vim.pack.add({
  { src = "https://github.com/987poiuytrewq/direct.vim", name = "direct.vim" },
  { src = "https://github.com/echasnovski/mini.nvim", name = "mini.nvim" },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    version = "main",
  },
  { src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary.nvim" },
  { src = "https://github.com/windwp/nvim-ts-autotag", name = "nvim-ts-autotag" },
  { src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns.nvim" },
  { src = "https://github.com/karb94/neoscroll.nvim", name = "neoscroll.nvim" },
  { src = "https://github.com/chaoren/vim-wordmotion", name = "vim-wordmotion" },
  { src = "https://github.com/stevearc/conform.nvim", name = "conform.nvim" },
  { src = "https://github.com/mfussenegger/nvim-lint", name = "nvim-lint" },
  { src = "https://github.com/antoinemadec/FixCursorHold.nvim", name = "FixCursorHold.nvim" },
  { src = "https://github.com/nvim-neotest/nvim-nio", name = "nvim-nio" },
  { src = "https://github.com/nvim-neotest/neotest", name = "neotest" },
  { src = "https://github.com/nvim-neotest/neotest-python", name = "neotest-python" },
  { src = "https://github.com/nvim-neotest/neotest-plenary", name = "neotest-plenary" },
  { src = "https://github.com/haydenmeade/neotest-jest", name = "neotest-jest" },
  { src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" },
  { src = "https://github.com/hrsh7th/nvim-cmp", name = "nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp", name = "cmp-nvim-lsp" },
  { src = "https://github.com/hrsh7th/cmp-buffer", name = "cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path", name = "cmp-path" },
  { src = "https://github.com/nvim-lualine/lualine.nvim", name = "lualine.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons", name = "nvim-web-devicons" },
  { src = "https://github.com/akinsho/bufferline.nvim", name = "bufferline.nvim" },
  { src = "https://github.com/mason-org/mason.nvim", name = "mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim", name = "mason-lspconfig.nvim" },
  {
    src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    name = "mason-tool-installer.nvim",
  },
}, { confirm = false })

require("plugins.editing")
require("plugins.navigation")
require("plugins.treesitter")
require("plugins.ui")
require("plugins.language")
require("plugins.formatting")
require("plugins.testing")
