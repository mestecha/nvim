return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 300,
    icons = { mappings = false },
    spec = {
      { "<leader>f", group = "find" },
      { "<leader>l", group = "lsp" },
      { "<leader>b", group = "buffer" },
      { "<leader>g", group = "git" },
      { "<leader>x", group = "trouble" },
      { "<Tab>", desc = "next buffer" },
      { "<S-Tab>", desc = "prev buffer" },
      { "<leader>bc", ":BufferLinePickClose<cr>", desc = "pick close" },
      { "<leader>bx", ":bd<cr>", desc = "close current" },
      { "<leader>bl", ":BufferLineCloseRight<cr>", desc = "close right" },
      { "<leader>bh", ":BufferLineCloseLeft<cr>", desc = "close left" },
      { "<leader>bo", ":BufferLineCloseOthers<cr>", desc = "close others" },
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts)
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<cr>", { desc = "next buffer" })
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { desc = "prev buffer" })
  end,
}
