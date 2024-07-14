require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require("lspconfig")

lsp.pyright.setup {
	settings = {
	    pyright = {
	      -- Using Ruff's import organizer
	      disableOrganizeImports = true,
	    },
	    python = {
	      analysis = {
				typeCheckingMode = "off",
                reportUndefinedVariable = "none",
                reportMissingImports = "none",
                reportUnusedImport = "none",
                reportUnusedVariable = "none",
                reportGeneralTypeIssues = "none",
	        ignore = { '*' },
	        },
		},
	}
}

lsp.tsserver.setup({})

lsp.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

lsp.ruff_lsp.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {
		"--select=E,F,UP,N,I,ASYNC,S,PTH",
		"--line-length=79",
		"--respect-gitignore",  -- Исключать из сканирования файлы в .gitignore
      	"--target-version=py312"
      },
    }
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
            prefix = "●",
            spacing = 4,
        },
        signs = true,
        update_in_insert = true,  -- Показывать диагностику во время ввода текста
    }
)
