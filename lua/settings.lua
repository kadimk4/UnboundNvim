local opt = vim.opt

opt.mouse = 'a'
opt.encoding = 'utf-8'
vim.cmd([[
filetype indent plugin on
syntax enable
]])
opt.swapfile = false

opt.number = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
vim.cmd "set noshowcmd"
vim.cmd "set noshowmode"

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "sumneko_lua" then
        -- only apply these settings for the "sumneko_lua" server
        opts.settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the 'vim', 'use' global
                    globals = {'vim', 'use'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    end
    server:setup(opts)
end)


-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
vim.o.completeopt = 'menuone,noselect'
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 3

vim.opt.termguicolors = true
require("netrw").setup({
  -- File icons to use when `use_devicons` is false or if
  -- no icon is found for the given file type.
  icons = {
    symlink = '',
    directory = '',
    file = '',
  },
  -- Uses mini.icon or nvim-web-devicons if true, otherwise use the file icon specified above
  use_devicons = true
  })


