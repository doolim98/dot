vim.o.smartindent = true
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.showcmd = false
vim.o.number=true
vim.o.termguicolors=true
vim.o.fillchars="vert:│"
vim.o.background="light"
-- vim.o.background="dark"
vim.o.cursorline = true
-- vim.g.solarized_statusline = 'normal'

vim.cmd('colorscheme solarized-flat')

-- hide end of buffer '~'
vim.cmd('highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg')
