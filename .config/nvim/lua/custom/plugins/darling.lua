--next Darling settings | Settings must be defined before return {}

-- Prefered Coloscheme
-- vim.cmd.colorscheme 'darkblue'
vim.cmd.colorscheme 'lunaperche'
-- vim.cmd.colorscheme 'ron'

-- Add a color column at line 70
vim.opt.syntax = "on";

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
vim.keymap.set('n', '<leader>w', ':w<cr>zt')

-- Close all and quit without saving as long as there aren't any changes
vim.keymap.set('n', '<leader>qa', ':qa<cr>')

-- Write current file and clear undo history
vim.keymap.set('n', '<leader>W', ':w<cr>:set undoreload=0<cr>:edit<cr>zt')

-- Write current file and clear undo history
vim.keymap.set('n', '<leader>cp', ':!xclip -sel clip %<esc>')

-- Write current file and quit
vim.keymap.set('n', '<leader>wq', ':wq<cr>')

-- Write all files and quit
vim.keymap.set('n', '<leader>wqa', ':wqa<cr>')

-- Show methods defined in the current file
vim.keymap.set('n', '<leader>sm', ':!showMethods %<cr>')

-- Find function/method
vim.keymap.set('n', '<leader>ff', '$/function.*')

-- New php doc comment single line
vim.keymap.set('n', '<leader>pd', '0o/** */<esc>')

-- New php doc comment multi line
vim.keymap.set('n', '<leader>pdm', '0o/** */<esc>bbea<cr><esc>02dwi     <esc>0O')

-- New private method
vim.keymap.set('n', '<leader>nsm', '0oprivate function (): void<esc>o{<esc>o}<esc>kk0wwwi')

-- New protected method
vim.keymap.set('n', '<leader>nsm', '0oprotected function (): void<esc>o{<esc>o}<esc>kk0wwwi')

-- New public method
vim.keymap.set('n', '<leader>npm', '0opublic function (): void<esc>o{<esc>o}<esc>kk0wwwi')

-- New public method
vim.keymap.set('n', '<leader>ncm', '0oprotected function (): void<esc>o{<esc>o}<esc>kk0wwwi')

-- Find word under cursor
vim.keymap.set('n', '<leader>fw', 'lbvey/<c-r>0<cr>')

-- Find word under cursor
vim.keymap.set('n', '<leader>l', '`1zt')

-- change color scheme
-- vim.keymap.set('n', '<leader>cc', ':colorscheme ')

function list_color_schemes()
    local vim_dir = vim.fn.stdpath('data')
    local colorscheme_dir = '/home/darling/manuallyInstalledBinaries/nvim-linux64/share/nvim/runtime/colors/'

    local color_schemes = {}

    for _, filename in ipairs(vim.fn.readdir(colorscheme_dir)) do
        if vim.fn.isdirectory(colorscheme_dir .. filename) == 0 then
            table.insert(color_schemes, filename)
        end
    end

    return color_schemes
end

function cycle_color_schemes()
    local current_scheme = vim.fn.execute('colorscheme'):gsub("\n", "")
    local available_schemes = list_color_schemes()
    local next_scheme

    for i, scheme in ipairs(available_schemes) do
    print(available_schemes[(i % #available_schemes) + 1])
        local scheme_name = scheme:gsub("%.vim$", "")
        if scheme_name == current_scheme then
            next_scheme = available_schemes[(i % #available_schemes) + 1]:gsub("%.vim$", "")
            break
        end
    end

    if next_scheme then
        vim.cmd('colorscheme ' .. next_scheme)
        print('Switched to ' .. next_scheme .. ' color scheme')
    else
        print('Color scheme not found: ' .. current_scheme)
    end
end

-- Cycle through color schemes
vim.api.nvim_set_keymap('n', '<leader>cc', [[:lua cycle_color_schemes()<CR>]], { noremap = true, silent = true })

-- Enter command mode, and begin a call to read !, the
-- output of whatever command is then entered will be
-- inserted into the current file on the line below
-- the line the cursor is currently on.
vim.keymap.set('n', '<leader>iso', ':read !')

-- Edit init.lua
vim.keymap.set('n', '<leader>elc', ':tabe $MYVIMRC<cr>')

-- Edit darling.lua
vim.keymap.set('n', '<leader>edc', ':tabe ~/.config/nvim/lua/custom/plugins/darling.lua<cr>')

-- Darling Auto-commands :
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- return {} is required even if it is empty.
return {
    'phpactor/phpactor',
}
