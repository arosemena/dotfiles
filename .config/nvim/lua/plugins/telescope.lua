return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  version = false, -- telescope did only one release, so use HEAD for now
  dependencies = {
    {
      'nvim-lua/plenary.nvim',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      enabled = vim.fn.executable('make') == 1,
      config = function()
        require('telescope').load_extension('fzf')
      end,
    },
  },
  keys = {
    {
      '<leader>,',
      '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>',
      desc = 'Switch Buffer',
    },
    { '<leader>:',       '<cmd>Telescope command_history<cr>',                          desc = 'Command History' },
    -- find
    { '<leader>fb',      '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>', desc = 'Buffers' },
    { '<leader>fr',      '<cmd>Telescope oldfiles<cr>',                                 desc = 'Recent' },
    -- git
    { '<leader>gc',      '<cmd>Telescope git_commits<CR>',                              desc = 'commits' },
    { '<leader>gs',      '<cmd>Telescope git_status<CR>',                               desc = 'status' },
    -- search
    { '<leader>sa',      '<cmd>Telescope autocommands<cr>',                             desc = 'Auto Commands' },
    { '<leader>sb',      '<cmd>Telescope current_buffer_fuzzy_find<cr>',                desc = 'Buffer' },
    { '<leader>sc',      '<cmd>Telescope command_history<cr>',                          desc = 'Command History' },
    { '<leader>sC',      '<cmd>Telescope commands<cr>',                                 desc = 'Commands' },
    { '<leader>sd',      '<cmd>Telescope diagnostics bufnr=0<cr>',                      desc = 'Document diagnostics' },
    { '<leader>sD',      '<cmd>Telescope diagnostics<cr>',                              desc = 'Workspace diagnostics' },
    { '<leader>sh',      '<cmd>Telescope help_tags<cr>',                                desc = 'Help Pages' },
    { '<leader>sH',      '<cmd>Telescope highlights<cr>',                               desc = 'Search Highlight Groups' },
    { '<leader>sk',      '<cmd>Telescope keymaps<cr>',                                  desc = 'Key Maps' },
    { '<leader>sM',      '<cmd>Telescope man_pages<cr>',                                desc = 'Man Pages' },
    { '<leader>sm',      '<cmd>Telescope marks<cr>',                                    desc = 'Jump to Mark' },
    { '<leader>so',      '<cmd>Telescope vim_options<cr>',                              desc = 'Options' },
    { '<leader>sR',      '<cmd>Telescope resume<cr>',                                   desc = 'Resume' },
    { '<leader><space>', '<cmd>Telescope resume<cr>',                                   desc = 'Resume' },
    {
      '<leader>pf',
      function()
        require('telescope.builtin').find_files({
          find_command = { 'rg', '--files', '--hidden' },
        })
      end,
      desc = 'Find Files'
    },
    {
      '<leader>ps',
      function()
        require('telescope.builtin').live_grep({
          file_ignore_patterns = { '^.git/', 'pnpm-lock.yaml' },
        })
      end,
      desc = 'Grep string'
    },
  },
  opts = function()
    local actions = require('telescope.actions')
    return {
      defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        -- open files in the first window that is an actual file.
        -- use the current window if no other window is available.
        get_selection_window = function()
          local wins = vim.api.nvim_list_wins()
          table.insert(wins, 1, vim.api.nvim_get_current_win())
          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].buftype == '' then
              return win
            end
          end
          return 0
        end,
        mappings = {
          i = {
            ['<C-Down>'] = actions.cycle_history_next,
            ['<C-Up>'] = actions.cycle_history_prev,
            ['<C-f>'] = actions.preview_scrolling_down,
            ['<C-b>'] = actions.preview_scrolling_up,
          },
          n = {
            ['q'] = actions.close,
          },
        },
      },
    }
  end,
}
