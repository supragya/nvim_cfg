-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        -- or                          , branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- use ({
    --     "folke/tokyonight.nvim",
    --     as = "tokyonight",
    --     config = function()
    --         vim.cmd('colorscheme tokyonight-storm')
    --     end,
    -- })

    use({
        "ellisonleao/gruvbox.nvim",
        as = "gruvbox",
        config = function()
            vim.cmd('colorscheme gruvbox')
        end
    })

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use({
        'scottmckendry/cyberdream.nvim',
        as = "cyberdream"
        -- config = function()
        --     vim.cmd('colorscheme cyberdream')
        -- end,
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        as = "treesitter",
        {
            run = ':TSUpdate'
        }
    })

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = { --- Uncomment the two plugins below if you want to manage the language servers from neovim
        -- {'williamboman/mason.nvim'},
        -- {'williamboman/mason-lspconfig.nvim'},
        {'neovim/nvim-lspconfig'}, {'hrsh7th/nvim-cmp'}, {'hrsh7th/cmp-nvim-lsp'}, {'L3MON4D3/LuaSnip'}}
    })

    -- use({
    --     'akinsho/bufferline.nvim',
    --     tag = "*",
    --     requires = 'nvim-tree/nvim-web-devicons'
    -- })

    use({
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons' -- optional
        }
    })

    use({
        "nvim-neotest/neotest",
        requires = {"nvim-neotest/nvim-nio", "nvim-lua/plenary.nvim", "antoinemadec/FixCursorHold.nvim",
                    "nvim-treesitter/nvim-treesitter", "rouge8/neotest-rust"}
    })

    use({"stevearc/conform.nvim"})

    use({
        "nvim-pack/nvim-spectre",
        requires = {"nvim-lua/plenary.nvim"}
    })

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        }
    }
end)
