local telescope = require('telescope')
local builtins = require('telescope.builtin')

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    }
  }
}
telescope.load_extension('fzf')

vim.cmd[[
  nnoremap <leader><leader> <cmd>lua require('telescope.builtin').find_files()<CR>
  nnoremap <leader><CR> <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>
  nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<CR>
]]
