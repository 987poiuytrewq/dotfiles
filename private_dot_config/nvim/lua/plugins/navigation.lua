local map = vim.keymap.set

require("mini.pick").setup()

map("n", "<leader>f", function()
  MiniPick.builtin.files()
end, { desc = "Find files" })
map("n", "<leader>b", function()
  MiniPick.builtin.buffers()
end, { desc = "Find buffers" })
map("n", "<leader>/", function()
  MiniPick.builtin.grep_live()
end, { desc = "Live grep" })
map("n", "<leader>t", function()
  MiniPick.builtin.help()
end, { desc = "Search help" })
