



-- User commands
-- Keep each command in its own section so this file scales cleanly.

-- TrimWhitespace
-- Removes trailing spaces in the current buffer while preserving window/cursor view.
local function trim_whitespace()
  local view = vim.fn.winsaveview()
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.winrestview(view)
end

vim.api.nvim_create_user_command("TrimWhitespace", trim_whitespace, {
  desc = "Delete trailing whitespace in current buffer",
})
