--next Darling settings | Setting must be defined before return {}

-- Add a color column at line 70
vim.opt.cursorcolumn = true;

-- Add a color column at line 70
vim.opt.cursorline = true;

-- Add a color column at line 70
vim.opt.colorcolumn = '70';

-- Relative line numbers
vim.opt.relativenumber = true;

-- Tabs to spaces
vim.opt.expandtab = true

-- Tabstop 
vim.opt.tabstop = 8

-- Tabstop 
vim.opt.softtabstop = 0

-- Expand tab 
vim.opt.expandtab = true

-- Shift width 
vim.opt.shiftwidth = 4

-- Smart tab 
vim.opt.smarttab = true

-- Don't wrap long lines
vim.opt.wrap = false

-- Turn on spellcheck
vim.opt.spell = true

-- Darling Keybindings 
-- TestKeyBinding: vim.keymap.set('n', '<leader>z', ':echo "test"');
-- KeyBindingTemplate: vim.keymap.set('n', '<leader>z', ':echo "test"')

-- Go to next buffer 
vim.keymap.set('n', '<leader>nb', ':bnext<cr>')

-- Go to previous buffer 
vim.keymap.set('n', '<leader>pb', ':bprev<cr>')

-- Write current file
vim.keymap.set('n', '<leader>w', ':w<cr>')

-- Write current file and clear undo history
vim.keymap.set('n', '<leader>W', ':w<cr>:set undoreload=0<cr>:edit<cr>')

-- Write current file and clear undo history
vim.keymap.set('n', '<leader>cp', ':!xclip -sel clip %<esc>')

-- return {} is required even if it is empty.
return {
}
