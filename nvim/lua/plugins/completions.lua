return {
  {
    'micangl/cmp-vimtex',
    ft = 'tex',
    config = function()
      require('cmp_vimtex').setup {}
    end,
  },
  {
    'saghen/blink.compat',
    version = '*',
    opts = { impersonate_nvim_cmp = false },
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      { 'micangl/cmp-vimtex' },
      { 'folke/lazydev.nvim' },
    },
    lazy = false, -- lazy loading handled internally
    version = '*',

    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = { preset = 'default' },
      snippets = { preset = 'luasnip' },

      sources = {
        default = { 'lsp', 'path', 'cmdline', 'snippets', 'buffer', 'vimtex' },
        providers = {
          snippets = {
            score_offset = 1,
          },
          vimtex = {
            name = 'vimtex',
            module = 'blink.compat.source',
            score_offset = 3,
          },
        },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      fuzzy = { implementation = 'lua' },

      -- experimental signature help support
      signature = { enabled = true },
    },
    opts_extend = { 'sources.default' },
  },
}
