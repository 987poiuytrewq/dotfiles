local map = vim.keymap.set

local function show_grep_results(buf_id, items, query)
  local display_items = vim.tbl_map(function(item)
    if type(item) ~= "string" then
      return item
    end

    local path, _, _, text = item:match("^(.-)%z(%d+)%z(%d+)%z(.*)$")
    if not path then
      return item
    end

    return { path = path, text = path .. " │ " .. text }
  end, items)

  MiniPick.default_show(buf_id, display_items, query, { show_icons = true })
end

require("mini.pick").setup({
  window = {
    config = function()
      return {
        relative = "editor",
        anchor = "NW",
        row = 1,
        col = 1,
        width = math.max(1, vim.o.columns - 2),
        height = math.max(1, vim.o.lines - vim.o.cmdheight - 2),
        border = { " ", " ", " ", " ", " ", " ", " ", " " },
        style = "minimal",
      }
    end,
    prompt_prefix = "",
    prompt_caret = "▏",
  },
  source = {
    show = function(buf_id, items, query)
      MiniPick.default_show(buf_id, items, query, { show_icons = true })
    end,
  },
})

local function set_picker_highlights()
  vim.api.nvim_set_hl(0, "MiniPickNormal", { link = "Normal" })
  vim.api.nvim_set_hl(0, "MiniPickBorder", { link = "Normal" })
  vim.api.nvim_set_hl(0, "MiniPickIconDirectory", { link = "Normal" })
  vim.api.nvim_set_hl(0, "MiniPickIconFile", { link = "Normal" })
  vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { link = "CursorLine" })
end

local highlight_group = vim.api.nvim_create_augroup("minipick_highlights", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = highlight_group,
  callback = set_picker_highlights,
  desc = "Apply MiniPick highlights",
})
set_picker_highlights()

map("n", "<leader>f", function()
  MiniPick.builtin.files()
end, { desc = "Find files" })
map("n", "<leader>b", function()
  MiniPick.builtin.buffers()
end, { desc = "Find buffers" })
map("n", "<leader>/", function()
  MiniPick.builtin.grep_live({}, {
    source = { show = show_grep_results },
  })
end, { desc = "Live grep" })
map("n", "<leader>t", function()
  MiniPick.builtin.help()
end, { desc = "Search help" })
