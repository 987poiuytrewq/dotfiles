local parsers = {
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "terraform",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
}

local languages = {
  css = "css",
  html = "html",
  javascript = "javascript",
  javascriptreact = "tsx",
  json = "json",
  lua = "lua",
  markdown = "markdown",
  python = "python",
  terraform = "terraform",
  typescript = "typescript",
  typescriptreact = "tsx",
  vim = "vim",
  help = "vimdoc",
}

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_highlighting", { clear = true }),
  pattern = vim.tbl_keys(languages),
  callback = function(event)
    pcall(vim.treesitter.start, event.buf, languages[vim.bo[event.buf].filetype])
  end,
  desc = "Enable Tree-sitter highlighting",
})

require("nvim-treesitter").install(parsers)
require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
})
