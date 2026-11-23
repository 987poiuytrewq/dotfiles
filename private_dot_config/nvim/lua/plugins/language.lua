local map = vim.keymap.set

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_enable = true,
})
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "pyright",
    "terraformls",
    "html",
    "cssls",
    "jsonls",
    "prettier",
    "eslint_d",
    "yapf",
    { "flake8", version = "7.1.2" },
    { "isort", version = "5.13.2" },
  },
  auto_update = false,
  run_on_start = true,
})

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  virtual_text = { spacing = 2, prefix = "●" },
})

local group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(event)
    local opts = { buffer = event.buf }
    map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Find references" }))
    map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
    map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
    map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
  end,
  desc = "Set LSP buffer mappings",
})
