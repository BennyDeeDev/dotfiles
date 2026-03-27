-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 16
vim.opt.relativenumber = false
vim.o.title = true
vim.o.titlestring = "%t - " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " - nvim"
