return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {},
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "diagnostics" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "buffer diagnostics" },
    { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "symbols" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "quickfix" },
  },
}
