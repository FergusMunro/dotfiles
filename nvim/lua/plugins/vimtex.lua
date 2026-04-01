return {
  {
    'lervag/vimtex',
    lazy = false,
    -- tag = "v2.15", -- uncomment to pin to a specific release
    --global vimtex settings
    --
    config = function()
      vim.g.vimtex_imaps_enabled = 0 --i.e., disable them
      --vimtex_view_settings
      vim.g.vimtex_view_method = 'zathura' -- change this, depending on what you want to use..sumatraPDF, or skim, or zathura, or...
      vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
      --quickfix settings
      vim.g.vimtex_quickfix_open_on_warning = 0 --  don't open quickfix if there are only warnings
      vim.g.vimtex_quickfix_ignore_filters =
        { 'Underfull', 'Overfull', 'LaTeX Warning: .\\+ float specifier changed to', 'Package hyperref Warning: Token not allowed in a PDF string' }

      vim.o.conceallevel = 2
      vim.g.tex_conceal = 'abdmgs'

      vim.g.vimtex_compiler_latexmk = {
        out_dir = 'build',
      }
      vim.keymap.set('i', '<C-f>', [[<Esc>:exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR><CR>]])
      vim.keymap.set('n', '<C-f>', [[ :silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR> ]])
    end,
  },
}
