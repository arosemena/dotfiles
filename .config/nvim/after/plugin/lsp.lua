local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
  settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
})

-- Adds eslint fix step to formatting keymap
lsp.configure('eslint', {
  on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', '<leader>l', function()
      vim.cmd('EslintFixAll')
      vim.lsp.buf.format()
      vim.cmd('Prettier')
    end, opts)
    vim.keymap.set('n', '<leader>ll', function()
      vim.lsp.buf.format()
      vim.cmd('Prettier')
    end, opts)
  end
})

-- Change vue lsp settings
lsp.configure('vue-language-server', {
  settings = {
    volar = {
      formatting = {
        printWidth = 80,
      }
    }
  }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'X',
    warn = '!',
    hint = 'h',
    info = 'i'
  }
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '<F2>', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', '<S-F2>', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', '<leader><cr>', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
