require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<C-h>", ":TmuxNavigateLeft<cr>", { desc = "switch window left" })
map("n", "<C-l>", ":TmuxNavigateRight<cr>", { desc = "switch window right" })
map("n", "<C-j>", ":TmuxNavigateUp<cr>", { desc = "switch window down" })
map("n", "<C-k>", ":TmuxNavigateDown<cr>", { desc = "switch window up" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
