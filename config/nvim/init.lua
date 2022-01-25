require "user.packer"
require "user.keymaps"
require "user.appearance"
require "user.telescope"

-- General settings
vim.o.hidden = true
vim.o.swapfile = false
vim.o.mouse ="a"
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.shellcmdflag = "-ic"
vim.o.virtualedit = "onemore"

--  Return to last edit position when opening files
vim.cmd([[
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

-- File type au
-- vim.cmd([[
-- autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
-- autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
-- ]])

