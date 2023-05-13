require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'vim', 'help', 'query', 'javascript', 'typescript', 'rust', 'vue'},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
