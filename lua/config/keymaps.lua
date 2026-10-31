-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function new_file()
  vim.ui.input({
    prompt = "New file: ",
    default = vim.fn.getcwd() .. "/",
    completion = "file",
  }, function(filename)
    if not filename or vim.trim(filename) == "" then
      return
    end

    local path = vim.fn.fnamemodify(vim.fs.normalize(filename), ":p")
    if filename:sub(-1) == "/" or vim.fn.isdirectory(path) == 1 then
      vim.notify("Enter a file name, not a directory", vim.log.levels.WARN)
      return
    end

    vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
    vim.api.nvim_cmd({ cmd = "edit", args = { path } }, {})
    vim.cmd.startinsert()
  end)
end

vim.keymap.set("n", "<C-n>", new_file, { desc = "New File" })
vim.keymap.set("n", "<leader>fn", new_file, { desc = "New File" })
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>write<cr>", { desc = "Save File", silent = true })
vim.keymap.set({ "n", "i" }, "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find File", silent = true })
vim.keymap.set({ "n", "i" }, "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Files", silent = true })

vim.keymap.set("t", "<Esc>", [[<C-\><C-n><cmd>ToggleTerm<cr>]], {
  desc = "Exit terminal and toggle",
})
