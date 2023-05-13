local builtin = require('telescope.builtin')


vim.keymap.set('n', '<leader>pf', function()
  builtin.find_files({
    hidden = true,
    file_ignore_patterns = { '^.git/', 'pnpm-lock.yaml' },
  })
end, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function() 
  builtin.live_grep({
    file_ignore_patterns = { '^.git/', 'pnpm-lock.yaml' },
  })
end, {})
vim.keymap.set('n', '<leader>pw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>f', builtin.resume, {})
