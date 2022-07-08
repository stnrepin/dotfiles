local telescope = require('telescope')
local builtins = require('telescope.builtin')

-- @todo: Move `map()` to utils, replace these lines with it.
vim.cmd[[
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
]]
vim.cmd[[
    nnoremap <leader><leader> <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
]]

