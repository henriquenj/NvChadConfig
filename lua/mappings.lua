require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Emacs-style line navigation in normal/insert/cmdline contexts.
map("n", "<C-a>", "0", { desc = "Line start" })
map("n", "<C-e>", "$", { desc = "Line end" })
map("v", "<C-a>", "0", { desc = "Line start" })
map("v", "<C-e>", "$", { desc = "Line end" })
map("i", "<C-a>", "<C-o>0", { desc = "Line start" })
map("i", "<C-e>", "<End>", { desc = "Line end" })
map("c", "<C-a>", "<Home>", { desc = "Cmdline start" })
map("c", "<C-e>", "<End>", { desc = "Cmdline end" })

-- Window management (Spacemacs-style under SPC w).
local function toggle_window_maximize()
  local current_win = vim.api.nvim_get_current_win()
  local tab = vim.t

  if tab.zoomed_win == current_win and tab.zoom_restore_cmd then
    vim.cmd(tab.zoom_restore_cmd)
    tab.zoomed_win = nil
    tab.zoom_restore_cmd = nil
    return
  end

  tab.zoomed_win = current_win
  tab.zoom_restore_cmd = vim.fn.winrestcmd()
  vim.cmd "wincmd |"
  vim.cmd "wincmd _"
end

map("n", "<leader>w<Tab>", "<C-w>p", { desc = "Switch to previous window" })
map("n", "<leader>w=", "<C-w>=", { desc = "Balance windows" })
map("n", "<leader>w_", "<C-w>|", { desc = "Maximize window width" })
map("n", "<leader>wd", "<C-w>c", { desc = "Delete window" })
map("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Move to window below" })
map("n", "<leader>wk", "<C-w>k", { desc = "Move to window above" })
map("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })
map("n", "<leader>wm", toggle_window_maximize, { desc = "Toggle window maximize" })

-- Emacs-style window shortcuts.
map("n", "<C-x>1", "<C-w>o", { desc = "Close other windows" })
map("n", "<C-x>2", "<C-w>s", { desc = "Split window below" })
map("n", "<C-x>3", "<C-w>v", { desc = "Split window right" })

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
-- quit
map("n", "<leader>qq", "<cmd>confirm qa<CR>", { desc = "Quit Neovim" })
-- search in files
map({"n","v"}, "<leader>*", builtin.grep_string, { desc = "Search word under cursor" })
map("n", "<leader>/", builtin.live_grep, { desc = "Search whole repo" })
-- search for files
map("n", "<leader>pf", builtin.git_files, { desc = "Search files in repo" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
