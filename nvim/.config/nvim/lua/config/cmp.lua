local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-p>'] = function(fallback)
      fallback()
    end
  }),
  sources = cmp.config.sources(
    { { name = 'nvim_lsp' } },
    { { name = 'buffer' },
  })
})
