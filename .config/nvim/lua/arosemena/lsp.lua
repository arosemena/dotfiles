require('lspconfig').tsserver.setup {
  on_attach = function(_, bufnr)
    local hasPrettier = vim.fn.filereadable('.prettierrc')
    if hasPrettier ~= 0 then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.cmd.Prettier()
        end
      })
    end
  end
}
