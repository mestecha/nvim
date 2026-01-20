return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          { filetype = "NvimTree", text = "files", separator = true },
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
      },
    })
  end,
}
