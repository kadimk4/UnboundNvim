vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use { 'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp', }

  use { 'windwp/nvim-autopairs',
      config = function()
      require("nvim-autopairs").setup()
  end}

  use 'williamboman/nvim-lsp-installer'

  --- Автодополнлялка к файловой системе
  use {
	    'dense-analysis/ale',
	    config = function()
	        -- Configuration goes here.
	        local g = vim.g

	        g.ale_linters = {
	        	python = {'mypy'},
	            lua = {'lua_language_server'}
	        }
	    end
	}

end)

