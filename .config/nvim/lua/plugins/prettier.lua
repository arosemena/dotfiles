return {
  'MunifTanjim/prettier.nvim',
  dependencies = {
    { 'jose-elias-alvarez/null-ls.nvim' },
  },
  config = function()
    require('prettier').setup({
      bin = 'prettierd',
      filetypes = {
        'css',
        'graphql',
        'html',
        'javascript',
        'javascriptreact',
        'json',
        'less',
        'markdown',
        'scss',
        'typescript',
        'typescriptreact',
        'yaml',
        'astro',
      },
    })
  end,
}
