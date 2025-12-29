require "nvchad.autocmds"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown,tex,text",
  command = "call pencil#init({'wrap': 'soft'})",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown,tex,text",
  command = "set spell",
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.norg" },
  command = "set conceallevel=3",
})
