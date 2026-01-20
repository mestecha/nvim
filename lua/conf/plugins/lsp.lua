return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
  },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local function opts(desc)
          return { buffer = event.buf, desc = desc }
        end

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts("hover"))
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts("definition"))
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts("declaration"))
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts("implementation"))
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts("type definition"))
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts("references"))
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts("signature"))
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts("rename"))
        vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts("code action"))
        vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, opts("diagnostics"))
      end,
    })


    -- Mason setup
    require("mason").setup({
      ensure_installed = {
      },
    })

    -- Mason-lspconfig setup
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd" },
      automatic_installation = true,
      handlers = {
        -- Default handler for automatically configuring installed servers
        function(server_name)
          require("lspconfig")[server_name].setup({}) end,

        -- You can add custom handlers for specific servers here
        -- For example:
        -- tsserver = function(_, opts)
        --   require("lspconfig").tsserver.setup(opts)
        -- end,
      },
    })

    local cmp = require("cmp")

    local kind_icons = {
      Text = "",
      Method = "m",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }
    -- find more here: https://www.nerdfonts.com/cheat-sheet

    cmp.setup({
      sources = {
        {name = "nvim_lsp"},
      },

     mapping = {
       ["<C-k>"] = cmp.mapping.select_prev_item(),
       ["<C-j>"] = cmp.mapping.select_next_item(),
       ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
       ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
       ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
       ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
       ["<C-e>"] = cmp.mapping {
         i = cmp.mapping.abort(),
         c = cmp.mapping.close(),
       },
       -- Accept currently selected item. If none selected, `select` first item.
       -- Set `select` to `false` to only confirm explicitly selected items.
       ["<CR>"] = cmp.mapping.confirm { select = false },
       ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
           cmp.select_next_item()
         else
           fallback()
         end
       end, {
         "i",
         "s",
       }),
       ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
           cmp.select_prev_item()
         else
           fallback()
         end
       end, {
         "i",
         "s",
       }),
     },

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          --nvim_lsp_signature_help = "[LSP-Signature]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    }
  })
  end
}
