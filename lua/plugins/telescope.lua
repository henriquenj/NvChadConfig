return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")

      opts.defaults = opts.defaults or {}
      opts.defaults.mappings = opts.defaults.mappings or {}
      opts.defaults.mappings.i = opts.defaults.mappings.i or {}
      opts.defaults.mappings.n = opts.defaults.mappings.n or {}
      opts.defaults.file_ignore_patterns = opts.defaults.file_ignore_patterns or {}
      opts.pickers = opts.pickers or {}
      opts.pickers.find_files = opts.pickers.find_files or {}
      opts.pickers.live_grep = opts.pickers.live_grep or {}
      opts.pickers.grep_string = opts.pickers.grep_string or {}

      if not vim.tbl_contains(opts.defaults.file_ignore_patterns, "^%.git/.+/.+") then
        table.insert(opts.defaults.file_ignore_patterns, "^%.git/.+/.+")
      end

      -- Move selection with C-j / C-k
      opts.defaults.mappings.i["<C-j>"] = actions.move_selection_next
      opts.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
      opts.defaults.mappings.n["<C-j>"] = actions.move_selection_next
      opts.defaults.mappings.n["<C-k>"] = actions.move_selection_previous

      -- Always include dotfiles in file pickers
      opts.pickers.find_files.hidden = true
      opts.pickers.find_files.no_ignore = false
      -- Keep live_grep aligned with hidden-file behavior
      opts.pickers.live_grep.additional_args = function()
        return { "--hidden" }
      end
      opts.pickers.grep_string.additional_args = function()
        return { "--hidden" }
      end

      return opts
    end,
  },
}
