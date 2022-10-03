local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', 'j', 'gj')
map('n', 'k', 'gk')


-- Fix last spell error.
map('i', '<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u')

-- Clear the search register.
map('n', '<leader>;', ':nohlsearch<CR>')

-- Format the current paragraph.
map('n', '<leader>=', 'vipgq')

-- List buffers.
map('n', '<leader>/', ':ls<CR>')

-- Go to previous buffer.
map('n', '<leader>o', ':b#<CR>')

-- Close nvim-tree
map('n', '<F2>', ':NvimTreeFindFileToggle<CR>')
