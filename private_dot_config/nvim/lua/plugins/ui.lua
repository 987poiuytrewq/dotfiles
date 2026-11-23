local map = vim.keymap.set

require("gitsigns").setup({
  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "▁" },
    topdelete = { text = "▔" },
    changedelete = { text = "┃" },
    untracked = { text = "┃" },
  },
  signs_staged = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "▁" },
    topdelete = { text = "▔" },
    changedelete = { text = "┃" },
  },
})
require("nvim-web-devicons").setup({
  default = true,
  color_icons = false,
})
vim.api.nvim_set_hl(0, "DevIconDefault", { link = "Normal" })

require("bufferline").setup({
  options = {
    style_preset = {
      require("bufferline").style_preset.minimal,
      require("bufferline").style_preset.no_italic,
    },
    diagnostics = false,
    always_show_bufferline = true,
    color_icons = false,
    show_buffer_close_icons = true,
    show_close_icon = true,
    separator_style = "thin",
  },
})

require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    icons_enabled = true,
    component_separators = { left = "│", right = "│" },
    section_separators = "",
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = " ●",
          readonly = " ",
          unnamed = "[No Name]",
        },
      },
    },
    lualine_x = { "branch", "diff" },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = " ●",
          readonly = " ",
          unnamed = "[No Name]",
        },
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})

map("n", "<M-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer tab" })
map("n", "<M-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer tab" })
