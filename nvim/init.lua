vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'
require 'keymaps'
require 'lazy-bootstrap'
require 'lazy-plugins'

vim.cmd.colorscheme 'catppuccin-macchiato'

-- vim: ts=2 sts=2 sw=2 et
