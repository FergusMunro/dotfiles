return {
  'chomosuke/typst-preview.nvim',

  lazy = false,
  ft = 'typst',
  version = '1.*',
  build = function()
    require('typst-preview').update()
  end,
  config = function()
    require('typst-preview').setup {
      dependencies_bin = {
        ['tinymist'] = 'tinymist',
      },

      open_cmd = 'firefox --new-window %s',
    }

    -- Keymaps specifically for Typst files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'typst',
      callback = function()
        vim.keymap.set('n', '<leader>tc', ':TypstPreviewFollowCursorToggle<CR>', { buffer = true, desc = 'Typst: [T]oggle [C]ursor Follow' })
      end,
    })
  end,
}
