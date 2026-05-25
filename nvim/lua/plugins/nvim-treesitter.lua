return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  config = function()
    -- Directly pass your settings without relying on the deleted .configs module
    require('nvim-treesitter').setup {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'haskell', 'r', 'rnoweb' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        disable = { 'latex' },
        additional_vim_regex_highlighting = { 'ruby', 'cpp', 'latex' },
      },
      indent = { enable = true, disable = { 'ruby', 'cpp' } },
    }
  end,
}
