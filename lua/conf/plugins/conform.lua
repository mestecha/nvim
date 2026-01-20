return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    })
  end,
}
