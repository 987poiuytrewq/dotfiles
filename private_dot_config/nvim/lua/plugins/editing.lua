require("mini.surround").setup()
require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.align").setup()

local neoscroll = require("neoscroll")
neoscroll.setup({ easing = "quadratic" })

vim.keymap.set("n", "<C-j>", function()
  neoscroll.ctrl_d({ easing = "quadratic" })
end, { desc = "Smooth half-page down" })
vim.keymap.set("n", "<C-k>", function()
  neoscroll.ctrl_u({ easing = "quadratic" })
end, { desc = "Smooth half-page up" })
