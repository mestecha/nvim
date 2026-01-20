return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "-" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- navigation
        map("n", "]h", gs.next_hunk, "next hunk")
        map("n", "[h", gs.prev_hunk, "prev hunk")

        -- actions
        map("n", "<leader>gs", gs.stage_hunk, "stage hunk")
        map("n", "<leader>gr", gs.reset_hunk, "reset hunk")
        map("n", "<leader>gS", gs.stage_buffer, "stage buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk, "undo stage")
        map("n", "<leader>gR", gs.reset_buffer, "reset buffer")
        map("n", "<leader>gp", gs.preview_hunk, "preview hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "blame line")
        map("n", "<leader>gd", gs.diffthis, "diff this")
      end,
    })
  end,
}
