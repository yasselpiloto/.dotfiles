vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = false

vim.g.mapleader = ','

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('plugins')
require('nvim-tree-config')

require('nvim-tree').setup {}

-- keymaps 
local map_util = require ('keymaps')
local nnoremap = map_util.nnoremap

nnoremap("<leader>1", ":NvimTreeToggle<CR>", gen_opts)
