-- General Neovim settings
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.signcolumn = 'yes'
opt.clipboard = 'unnamedplus'
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.mouse = 'a'
opt.laststatus = 3
opt.swapfile = false

-- Better UI for messages
opt.shortmess:append('c')
