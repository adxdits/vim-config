-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- lsp
-- virtual text
vim.diagnostic.config({
  virtual_text = true,
})
-- enabled lsp servers
vim.lsp.enable({ "jedi", "lua_ls", "rust-analyzer" })
