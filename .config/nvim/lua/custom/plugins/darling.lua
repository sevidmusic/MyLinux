-- Darling settings | Setting must be defined before return {}
-- Add a color column at line 70
vim.opt.colorcolumn = '70';

-- Darling Keybindings 
vim.keymap.set('n', '<leader>z', ':echo "test"');
-- KeyBindingTemplate: vim.keymap.set('n', '<leader>z', ':echo "test"')

-- return {} is required even if it is empty.
return {
}
