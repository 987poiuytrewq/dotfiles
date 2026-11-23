local map = vim.keymap.set

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      runner = "pytest",
      args = { "-svv" },
    }),
    require("neotest-plenary"),
    require("neotest-jest")({}),
  },
})

map("n", "<C-t>", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })
map("n", "<leader>tn", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run tests in file" })
map("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Toggle test summary" })
map("n", "<leader>to", function()
  require("neotest").output.open({ enter = true })
end, { desc = "Show test output" })
