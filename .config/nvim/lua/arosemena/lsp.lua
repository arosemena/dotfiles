local organize_imports = function()
  local params = {
    command = '_typescript.organizeImports',
    arguments = { vim.fn.expand('%:p') }
  }
  vim.lsp.buf.execute_command(params)
end


local on_attach = function(client, bufnr)
  -- Apply LSP formatting on save if client supports it
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      callback = function() vim.lsp.buf.format({ async = false }) end,
    })
  end

  -- Add organize imports command
  vim.keymap.set('n', '<leader>o', organize_imports, { buffer = bufnr })
end


require('lspconfig').ts_ls.setup {
  on_attach = on_attach
}

require('lspconfig').astro.setup {
  on_attach = on_attach
}
