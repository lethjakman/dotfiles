require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<C-h>", ":TmuxNavigateLeft<cr>", { desc = "switch window left" })
map("n", "<C-l>", ":TmuxNavigateRight<cr>", { desc = "switch window right" })
map("n", "<C-j>", ":TmuxNavigateDown<cr>", { desc = "switch window down" })
map("n", "<C-k>", ":TmuxNavigateUp<cr>", { desc = "switch window up" })

map("n", "<leader>gb", "<cmd>Gitsigns blame<cr>", { desc = "Git blame" })

map("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Telescope resume" })

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
