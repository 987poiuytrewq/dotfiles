vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.pack.add({
  {
    src = "https://github.com/987poiuytrewq/direct.vim",
    name = "direct.vim",
  },
}, { confirm = false })

local opt = vim.opt

opt.hidden = true
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.exrc = true
opt.secure = true
opt.ttimeoutlen = 0
opt.cursorline = true
opt.signcolumn = "yes"
opt.mouse = "a"
opt.list = true
opt.listchars = "tab:━━,nbsp:·"
opt.copyindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.wrap = true
opt.formatoptions = "crqj"
opt.breakindent = true
opt.linebreak = true
opt.showbreak = "└─"
opt.breakat:remove({ ":", "@", "$", "&" })
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.clipboard = "unnamed,unnamedplus"
opt.selection = "exclusive"
opt.splitright = true
opt.splitbelow = true
opt.scrollback = 100000
opt.foldmethod = "syntax"
opt.foldenable = true
opt.foldlevelstart = 99
opt.foldtext = [[substitute(getline(v:foldstart), '^.', '▶', '') . ' ... ' . substitute(getline(v:foldend), '^\s*', '', '')]]
opt.background = "dark"
opt.termguicolors = true
opt.hlsearch = true
opt.fillchars = { vert = " ", fold = " ", diff = " " }

vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/shims/python3")

local map = vim.keymap.set
map("n", "<leader>n", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>q", "<cmd>bdelete<CR>", { desc = "Close buffer" })
map("n", "<C-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<C-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>w", "<C-w>w", { desc = "Next window" })
map("n", "<leader>l", "<C-w>l", { desc = "Focus right window" })
map("n", "<leader>h", "<C-w>h", { desc = "Focus left window" })
map("n", "<leader>j", "<C-w>j", { desc = "Focus lower window" })
map("n", "<leader>k", "<C-w>k", { desc = "Focus upper window" })
map("n", "<C-c>", "<cmd>cp<CR>", { desc = "Previous quickfix item" })
map("i", "<C-p>", '<C-r>"', { desc = "Paste unnamed register" })
map({ "n", "x", "o" }, "H", "^", { desc = "First nonblank character" })
map({ "n", "x", "o" }, "L", "$", { desc = "End of line" })

map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Focus left window" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Focus lower window" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Focus upper window" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Focus right window" })

local groups = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = groups,
  callback = function()
    vim.cmd("silent! update!")
  end,
  desc = "Save changes automatically",
})

vim.api.nvim_create_autocmd("ColorScheme", {
  group = groups,
  callback = function()
    vim.api.nvim_set_hl(0, "EndOfBuffer", {
      fg = "#101010",
      bg = "#101010",
      ctermfg = 234,
      ctermbg = 234,
    })
    vim.api.nvim_set_hl(0, "DiffAdd", { fg = "NONE", bg = "#002000" })
    vim.api.nvim_set_hl(0, "DiffChange", { fg = "NONE", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiffText", { fg = "NONE", bg = "#000020" })
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = "NONE", bg = "#200000" })
  end,
  desc = "Apply personal highlight overrides",
})

vim.cmd.colorscheme("base16-vivid")
