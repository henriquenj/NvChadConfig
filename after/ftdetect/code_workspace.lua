-- Treat .code-workspace as JSON with comments
vim.filetype.add({
  extension = {
    ["code-workspace"] = "jsonc",
  },
})
