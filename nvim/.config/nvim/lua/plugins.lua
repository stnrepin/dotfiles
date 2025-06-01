-- ~/.local/share/nvim/site/pack/...
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.deps'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.deps`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.deps', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.deps | helptags ALL')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

local add = MiniDeps.add

function later_require(name)
  MiniDeps.later(function()
    require(name)
  end)
end

add('maksimr/Lucius2')
require('config.theme')

add({
  source = 'nvim-treesitter/nvim-treesitter',
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})
later_require('config.treesitter')

add('lewis6991/spellsitter.nvim')

add('lyokha/vim-xkbswitch')
later_require('config.xkbswitch')

add({
  source = 'kyazdani42/nvim-tree.lua',
  depends = { 'kyazdani42/nvim-web-devicons' },
})
require('config.nvim-tree')

add({
  source = 'hrsh7th/nvim-cmp',
  depends = {
    'hrsh7th/cmp-nvim-lsp',
  },
})

add('neovim/nvim-lspconfig')

add({
  source = 'nvim-telescope/telescope-fzf-native.nvim',
  post_checkout = function(data)
    vim.system({
      'cmake', '-S', '.', '-Bbuild', '-DCMAKE_BUILD_TYPE=Release',
      '-DCMAKE_POLICY_VERSION_MINIMUM=3.10', '&&',
      'cmake', '--build', 'build', '--config', 'Release'},
        { cwd = data.path }
      ):wait()
  end
})

add({
  source = 'SmiteshP/nvim-navbuddy',
  depends = {
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
  },
})

add('folke/lsp-colors.nvim')

add({
  source = 'nvim-telescope/telescope.nvim',
  depends = { 'nvim-lua/plenary.nvim' },
})

function load_lsp()
  require('config.lspconfig')
  require('config.cmp')
  require('config.telescope')
  require('config.navbuddy')
  vim.api.nvim_command('edit %')
end

vim.api.nvim_create_user_command(
  'LoadLsp',
  function(opts)
    print('Loading LSP plugins...')
    load_lsp()
    print('OK')
  end,
  {}
)
