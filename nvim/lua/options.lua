vim.g.have_nerd_font = true

vim.o.number = true

vim.o.mouse = 'a'

vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

vim.o.confirm = true

vim.cmd [[
autocmd BufEnter *.* :setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufEnter *.py :setlocal tabstop=4 shiftwidth=4
autocmd BufEnter *.cabal :setlocal tabstop=4 shiftwidth=4
autocmd TermOpen * startinsert
]]
vim.filetype.add {
  extension = {
    qml = 'qml',
    qmljs = 'qmljs',
  },
}

vim.opt.termguicolors = true

-- vim: ts=2 sts=2 sw=2 et
