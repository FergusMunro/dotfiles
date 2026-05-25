require('lazy').setup({

  -- single-line plugins
  'NMAC427/guess-indent.nvim',
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },

  -- basic plugins
  require 'plugins.gitsigns',
  require 'plugins.nvim-tree',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lazydev',
  require 'plugins.nvim-lspconfig',
  require 'plugins.bufferline',
  require 'plugins.bufdelete',
  require 'plugins.conform',
  require 'plugins.nvim-autopairs',
  require 'plugins.mini',
  require 'plugins.nvim-treesitter',
  require 'plugins.luasnip',
  require 'plugins.completions',
  require 'plugins.render-markdown',

  -- language plugins
  require 'plugins.languages.nvim-java',
  require 'plugins.languages.typst-preview',
  require 'plugins.languages.haskell-tools',
  require 'plugins.languages.lean',
  require 'plugins.languages.vimtex',
  require 'plugins.languages.obsidian', -- not really a language plugin but i treat it like one
  require 'plugins.languages.rnvim',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
