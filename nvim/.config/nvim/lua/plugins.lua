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

add('nvim-treesitter/nvim-treesitter')
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
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
    },
})

add('neovim/nvim-lspconfig')

add({
    source = 'nvim-telescope/telescope-fzf-native.nvim',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
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

function load_lsp()
    later_require('config.cmp')
    later_require('config.lspconfig')
    later_require('config.telescope')
    later_require('config.navbuddy')
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
