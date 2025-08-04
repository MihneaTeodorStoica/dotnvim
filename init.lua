-- init.lua: Neovim configuration entry point
-- Bootstraps plugin manager and loads core modules

-- Leader key must be set before requiring other modules
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core settings and keymaps
require('settings')
require('keymaps')

-- Setup plugins
require('plugins')
