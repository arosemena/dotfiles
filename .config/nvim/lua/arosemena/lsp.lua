
local organize_imports = function()
  local params = {
    command = '_typescript.organizeImports',
    arguments = { vim.fn.expand('%:p') }
  }
  vim.lsp.buf.execute_command(params)
end


require('lspconfig').ts_ls.setup {
  on_attach = function(_, bufnr)

    -- Run Prettier on save
    local hasPrettier = vim.fn.filereadable('.prettierrc')
    if hasPrettier ~= 0 then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function() vim.cmd.Prettier() end,
      })
    end

    -- Add organize imports command
    vim.keymap.set('n', '<leader>o', organize_imports, { buffer = bufnr })
  end
}
