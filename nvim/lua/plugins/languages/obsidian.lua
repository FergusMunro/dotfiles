return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = 'Personal',
        path = '~/Documents/Personal',
      },
    },

    daily_notes = {
      folder = 'notes/daily_notes',
      template = 'templates/Daily Note Template.md',

      default_tags = { 'dailyNotes' },
    },
  },
  config = function(_, opts)
    require('obsidian').setup(opts)

    vim.api.nvim_create_user_command('ObsidianInstantOpen', function()
      vim.cmd 'Obsidian open'
      os.execute '~/.config/hypr/scripts/summon_obsidian.sh'
    end, {})
  end,
}
