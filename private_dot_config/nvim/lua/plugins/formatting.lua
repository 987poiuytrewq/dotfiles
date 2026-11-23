local map = vim.keymap.set

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier", "eslint_d" },
    javascriptreact = { "prettier", "eslint_d" },
    typescript = { "prettier", "eslint_d" },
    typescriptreact = { "prettier", "eslint_d" },
    json = { "prettier" },
    python = { "yapf", "isort" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "never",
  },
})

map("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_format = "never" })
end, { desc = "Format buffer" })

local lint = require("lint")
lint.linters_by_ft = {
  lua = { "luacheck" },
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  python = { "flake8" },
}
lint.linters.luacheck.args = {
  "--globals",
  "vim",
  "--formatter",
  "plain",
  "--codes",
  "--ranges",
  "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("linting", { clear = true }),
  callback = function()
    if vim.bo.buftype == "" then
      lint.try_lint()
    end
  end,
  desc = "Run configured linters",
})
