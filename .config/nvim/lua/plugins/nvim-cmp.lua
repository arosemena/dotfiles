local icons = {
  Array         = ' ',
  Boolean       = '󰨙 ',
  Class         = ' ',
  Color         = ' ',
  Constant      = '󰏿 ',
  Constructor   = ' ',
  Enum          = ' ',
  EnumMember    = ' ',
  Event         = ' ',
  Field         = ' ',
  File          = ' ',
  Folder        = ' ',
  Function      = '󰊕 ',
  Interface     = ' ',
  Key           = ' ',
  Keyword       = ' ',
  Method        = '󰊕 ',
  Module        = ' ',
  Namespace     = '󰦮 ',
  Null          = ' ',
  Number        = '󰎠 ',
  Object        = ' ',
  Operator      = ' ',
  Package       = ' ',
  Property      = ' ',
  Reference     = ' ',
  Snippet       = ' ',
  String        = ' ',
  Struct        = '󰆼 ',
  Text          = ' ',
  TypeParameter = ' ',
  Unit          = ' ',
  Value         = ' ',
  Variable      = '󰀫 ',
}

return {
  'hrsh7th/nvim-cmp',
  version = false,
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  },
  opts = function()
    vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
    local cmp = require('cmp')
    return {
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-a>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<S-CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ['<C-CR>'] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
      }, {
        { name = 'buffer' },
      }),
      formatting = {
        format = function(_, item)
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = 'CmpGhostText',
        },
      },
    }
  end,
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    require('cmp').setup(opts)
  end,
}
