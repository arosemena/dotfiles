
local goToDef = require('arosemena/go-to-definition')

-- Core keymaps
vim.g.mapleader = ' '
local set = vim.keymap.set

-- Project view
set('n', '<leader>pv', vim.cmd.Ex)

-- Better scrolling
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')

-- Save and clipboard
set('v', '<leader>y', '"*y', {}) -- yank to system clipboard
set('n', '<leader>w', ':w<CR>')  -- simpler save

-- LSP
set('n', '<leader>l', vim.lsp.buf.format)
set('n', '<F2>', vim.diagnostic.goto_next)
set('n', '<S-F2>', vim.diagnostic.goto_prev)
set('n', '<leader><F2>', "<cmd>Telescope diagnostics<cr>")
set('n', '<leader>r', vim.lsp.buf.rename)
set('n', 'K', vim.lsp.buf.hover)
set('n', 'gd', goToDef)
set('n', 'gi', vim.lsp.buf.implementation)
set('n', 'gt', vim.lsp.buf.type_definition)
set('n', 'gK', vim.lsp.buf.signature_help)
set('i', '<c-k>', vim.lsp.buf.signature_help)
set('n', '<leader><CR>', vim.lsp.buf.code_action)
