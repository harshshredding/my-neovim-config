local use = require('packer').use
require('packer').startup(function()
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use 'wbthomason/packer.nvim' -- Package manager
end)

require("mason").setup()
require("mason-lspconfig").setup()
require'lspconfig'.kotlin_language_server.setup{}
require'lspconfig'.pyright.setup{}
