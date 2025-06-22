-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n",
  "<leader>sR",
  "<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<cr>",
  { desc = "Search and Replace (buffer)" }
)
