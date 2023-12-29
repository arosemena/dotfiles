return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gs', vim.cmd.Git },
    {
      '<leader>gcc',
      function()
        vim.cmd.Git 'stage .'
        vim.cmd.Git 'commit'
      end
    },
    {
      '<leader>gp',
      function()
        vim.cmd.Git 'push'
      end
    },
  }
}
