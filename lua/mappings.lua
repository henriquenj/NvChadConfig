require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")

-- Telescope builtin.commands only lists user/plugin commands.
-- This uses Vim command completion so <leader><leader> behaves closer to Spacemacs M-x.
local function command_palette()
  local commands = vim.fn.getcompletion("", "command")
  table.sort(commands)

  pickers
    .new({}, {
      prompt_title = "Command Palette",
      finder = finders.new_table({
        results = commands,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          if not selection then
            return
          end

          -- Insert the selected command into ":" prompt so args can be typed before execution.
          local cmd = selection[1] or selection.value
          local keys = vim.api.nvim_replace_termcodes(":" .. cmd .. " ", true, false, true)
          vim.api.nvim_feedkeys(keys, "nt", false)
        end)
        return true
      end,
    })
    :find()
end

map("n", "<leader><leader>", command_palette, { desc = "Command palette (all commands)" })
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
