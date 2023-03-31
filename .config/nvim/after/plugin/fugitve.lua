vim.keymap.set('n', '<leader>gs', vim.cmd.Git);

vim.keymap.set('n', '<leader>gcc', function ()
  vim.cmd.Git 'stage .'
  vim.cmd.Git 'commit'
end);

vim.keymap.set('n', '<leader>gp', function ()
  vim.cmd.Git 'push'
end);
