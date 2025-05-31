vim.diagnostic.config({ virtual_text = true })

local show_diags_float = function()
    local fmt = function(diag)
        return string.format('%s [%s]', diag.message, diag.code or 'no code')
    end
    vim.diagnostic.open_float(0, { scope='line', source='always', format=fmt })
end

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', show_diags_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.keymap.del('n', 'grn', {})
vim.keymap.del('n', 'gra', {})
vim.keymap.del('n', 'grr', {})
vim.keymap.del('n', 'gri', {})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    vim.bo[ev.buf].formatexpr = nil

    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>.', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  end,
})

vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        semanticHighlighting = true,
        multilineTokenSupport = true,
      }
    }
  },
})

vim.lsp.config.clangd = {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--completion-style=bundled',
    '--cross-file-rename',
    '--header-insertion=iwyu',
  },
  filetypes = { 'c', 'cpp', 'h', 'hpp', 'cc', 'cxx' },
}

vim.lsp.enable({'clangd'})

