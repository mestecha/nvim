return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "git files" })
    vim.keymap.set("n", "<leader>fr", builtin.live_grep, { desc = "grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
    vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true<cr>", { desc = "hidden files" })
  end
}
