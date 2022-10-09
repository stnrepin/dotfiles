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

-- @todo: Move `map()` to utils, replace these lines with it.
vim.cmd[[
    nnoremap <leader><leader> <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <CR><CR> <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>
]]
