require("nvim-autopairs").setup({
  check_ts = true,
  map_cr = true,
})

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

_G.MUtils = {}

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0 then
    return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end

remap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap= true})
