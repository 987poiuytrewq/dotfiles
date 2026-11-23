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
opt.background = "dark"
opt.termguicolors = true
opt.showmode = false
opt.hlsearch = true
opt.fillchars = { vert = " ", diff = " " }

vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/shims/python3")
vim.cmd.colorscheme("base16-chester")
