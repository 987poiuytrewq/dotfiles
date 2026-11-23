local group = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = group,
  callback = function()
    vim.cmd("silent! update!")
  end,
  desc = "Save changes automatically",
})
