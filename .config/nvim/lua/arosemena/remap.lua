vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<leader>l', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>o', function()
  vim.lsp.buf.execute_command({
    command = '_typescript.organizeImports',
    arguments = { vim.fn.expand('%:p') }
  })
end)
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.clear_references)

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('v', '<leader>y', '"*y', {}) -- yank to system clipboard

-- Close quickfix window with <CR>
vim.api.nvim_create_autocmd(
  'FileType', {
    pattern = { 'qf' },
    command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]]
  })
