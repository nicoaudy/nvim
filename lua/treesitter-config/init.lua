vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "html", "javascript", "php" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  rainbox = {
    enable = true,
    extended_mode = true, -- Also highlight non bracket delimeter like html tags, boolean or table.
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  autopairs = {
    enable = true
  }
}
