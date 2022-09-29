local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    }) end

function require_fn(file_path)
    return function() require(file_path) end
end

vim.cmd [[packadd packer.nvim ]]

-- @todo: Split like this:
--      https://github.com/fitrh/init.nvim/tree/main/lua/config/plugin/lspconfig
--

return require('packer').startup(function()
    -- Packer itself.
    use 'wbthomason/packer.nvim'

    -- Theme
    use {
        'folke/lsp-colors.nvim'
    }
    use {
        'arcticicestudio/nord-vim',
        config = [[ require('config.theme') ]],
        requires = {
            'lsp-colors.nvim'
        }
    }
    use {
        'chriskempson/base16-vim',
        --config = [[ vim.cmd('colorscheme base16-gruvbox-dark-hard') ]]
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = [[ require('config.nvim-treesitter') ]],
        run = [[ require('nvim-treesitter.install').update({ with_sync = true }) ]],

    }

    use {
        'bfrg/vim-cpp-modern',
        disable = true
    }
    use {
        'jackguo380/vim-lsp-cxx-highlight',
    }

    -- Autoswitch to English in NORMAL.
    use {
        'lyokha/vim-xkbswitch',
        config = [[ require('config.xkbswitch') ]],
    }
    -- Surround with specified text.
    use 'tpope/vim-surround'

    -- Project file tree.
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        config = [[ require('nvim-tree').setup() ]],
    }
    -- .editorconfig file support.
    use {
        'editorconfig/editorconfig-vim',
    }

    -- @todo: Conditional
    --
    use {
        'rust-lang/rust.vim'
    }

    use {
        'ray-x/lsp_signature.nvim',
    }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
        config = [[ require('config.cmp') ]],
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'hrsh7th/nvim-cmp',
        },
        config = [[ require('config.lspconfig') ]],
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

     use {
         'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim'
        },
         config = [[ require('config.telescope') ]],
     }

     use {
         'lewis6991/spellsitter.nvim'
     }
end)
