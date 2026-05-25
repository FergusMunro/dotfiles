return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    require('bufferline').setup {
      options = {
        -- Center the buffer line based on the current window
        custom_filter = function(buf, buf_nums)
          if vim.bo[buf].buftype == 'terminal' then
            return false
          end
          return true
        end,
        offsets = {
          {
            filetype = 'NvimTree', -- Change this based on your window's filetype (e.g., "NvimTree" or "telescope")
            text = 'File Explorer', -- You can change this to any text you prefer
            highlight = 'Directory', -- Highlight for the offset text
            padding = 1, -- Adjust padding to give space between the buffer line and the offset
          },
        },
        show_buffer_icons = true, -- Icons for buffers (requires nvim-web-devicons)
        show_buffer_close_icons = true, -- Close icons for buffers
        separator_style = 'thin', -- Buffer line separator style (e.g., 'thick', 'slant', 'thin', 'none')
        -- Enable or disable tab behavior (e.g., always show tabs, no numbers, etc.)
        always_show_bufferline = true,
      },
    }
  end,
}
