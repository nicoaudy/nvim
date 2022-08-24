require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "html", "javascript", "php" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
