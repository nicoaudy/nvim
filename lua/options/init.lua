vim.cmd('autocmd!')
vim.cmd('filetype plugin indent on')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"

vim.opt.clipboard = 'unnamedplus'         -- Allow nvim for copy clipboard
vim.opt.mouse = 'a'                       -- Allow mouse
vim.opt.smartcase = true
vim.opt.splitbelow = true                 -- force all horizontal splits to go below current window
vim.opt.splitright = true                 -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                  -- creates a swapfile
vim.opt.timeoutlen = 100                  -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                   -- enable persistent undo
vim.opt.updatetime = 300                  -- faster completion (4000ms default)
vim.opt.writebackup = false               -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                  -- convert tabs to spaces
vim.opt.shortmess = vim.o.shortmess .. 'c'
vim.opt.hidden = true
vim.opt.whichwrap = 'b,s,<,>,[,],h,l'
vim.opt.pumheight = 10
vim.opt.title = true
vim.opt.showmode = false
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = false -- No wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*', '*/vendor/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- but this doesn't work on iterm2

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Highlight
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

vim.opt.formatoptions:append { 'r' }
