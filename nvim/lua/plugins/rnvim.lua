return {
  'R-nvim/R.nvim',
  -- Only required if you also set defaults.lazy = true
  lazy = false,

  vim.keymap.set('v', '<leader>d', '<Plug>RSendSelection', { desc = 'Send selection to R' }),
  config = function()
    --vim.g.R_auto_start = 'on startup'
    --vim.g.R_pdfviewer = 'zathura'
  end,
}
