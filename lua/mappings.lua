require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local builtin = require("telescope.builtin")
map("n", "<leader><leader>", builtin.commands, { desc = "Command palette (Telescope commands)" })
map("n", "<C-s>", builtin.current_buffer_fuzzy_find, { desc = "Search in the buffer" })
-- git
map("n", "<leader>gs", "<cmd>Neogit<cr>" , { desc = "Show Neogit UI" })
map("n", "<leader>gfl", builtin.git_bcommits, { desc = "Git log of current file" })
-- buffers
map("n", "<leader>bb", builtin.buffers, { desc = "Move between buffers" })
map("n", "<leader>bd", "<cmd>confirm bdelete<CR>", { desc = "Close current buffer" })
map("n", "<leader>fs", "<cmd>w<CR>", { desc = "Save file" })
-- search in files
map({"n","v"}, "<leader>*", builtin.grep_string, { desc = "Search word under cursor" })
map("n", "<leader>/", builtin.live_grep, { desc = "Search whole repo" })
-- search for files
map("n", "<leader>pf", builtin.git_files, { desc = "Search files in repo" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
