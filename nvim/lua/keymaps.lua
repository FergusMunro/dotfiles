-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--- [[ Nvim Tree Commands]]

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })

vim.keymap.set('n', '<leader>x', '<Cmd>Bdelete<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>b', '<Cmd>bdelete<CR>', { desc = 'Close buffer + window' })

-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typst', 'markdown' },
  callback = function(event)
    local ft = vim.bo[event.buf].filetype

    if ft == 'typst' then
      vim.keymap.set('n', '<leader>ll', ':TypstPreviewToggle<CR>', {
        buffer = event.buf,
        desc = 'Live Preview',
      })
    elseif ft == 'markdown' then
      vim.keymap.set('n', '<leader>ll', '<cmd>ObsidianInstantOpen<CR>', {
        buffer = event.buf,
        desc = 'Obsidian: Open custom command',
      })
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
