---------------------------------------------------------------------
-------------------------- Darling Settings -------------------------
---------------------------------------------------------------------

-- IMPORTANT: Settings must be defined before return {} block

-- Prefered Coloscheme
vim.cmd.colorscheme 'lunaperche'

-- Enable vim's built in syntax highlighting
vim.opt.syntax = "on";

-- Enable a cursor column
vim.opt.cursorcolumn = true;

-- Enable cursor line
vim.opt.cursorline = true;

-- Highlight column 70 as a visual aide
vim.opt.colorcolumn = '70';

-- Enable relative line numbers
vim.opt.relativenumber = true;

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Set tabstop to 8, as is recommended by the docs
-- "Note: Setting 'tabstop' to any other value than 8 can make your
--  file appear wrong in many places."
vim.opt.tabstop = 8

-- Disable softtabstop
vim.opt.softtabstop = 0

-- Enable expandtab
vim.opt.expandtab = true

-- Set shiftwidth to 4 which will determine the Number of spaces to
-- use for each step of (auto)indent.
-- Used for |'cindent'|, |>>|, |<<|, etc.
vim.opt.shiftwidth = 4

-- Enable smart tab to so that a <Tab> in front of a line inserts
-- blanks according to the 'shiftwidth' value.
vim.opt.smarttab = true

-- Don't wrap long lines
vim.opt.wrap = false

-- Turn on spellcheck
vim.opt.spell = true

---------------------------------------------------------------------
------------------------- Darling Functions -------------------------
---------------------------------------------------------------------

function list_color_schemes()
    local colorscheme_dir = '/home/darling/manuallyInstalledBinaries/nvim-linux64/share/nvim/runtime/colors/'

    local color_schemes = {}

    for _, filename in ipairs(vim.fn.readdir(colorscheme_dir)) do
        if vim.fn.isdirectory(colorscheme_dir .. filename) == 0 then
            table.insert(color_schemes, filename)
        end
    end

    return color_schemes
end

function reverse_list_color_schemes()
    local colorscheme_dir = '/home/darling/manuallyInstalledBinaries/nvim-linux64/share/nvim/runtime/colors/'

    local color_schemes = {}

    for _, filename in ipairs(vim.fn.readdir(colorscheme_dir)) do
        if vim.fn.isdirectory(colorscheme_dir .. filename) == 0 then
            table.insert(color_schemes, filename)
        end
    end

    -- Reverse the color schemes table
    local reversed_color_schemes = {}
    for i = #color_schemes, 1, -1 do
        table.insert(reversed_color_schemes, color_schemes[i])
    end

    return reversed_color_schemes
end

function cycle_color_schemes()
    local current_scheme = vim.fn.execute('colorscheme'):gsub("\n", "")
    local available_schemes = list_color_schemes()
    local next_scheme

    for i, scheme in ipairs(available_schemes) do
        local scheme_name = scheme:gsub("%.vim$", "")
        if scheme_name == current_scheme then
            next_scheme = available_schemes[(i % #available_schemes) + 1]:gsub("%.vim$", "")
            break
        end
    end

    if next_scheme and next_scheme ~= 'README.txt' then
        vim.cmd('colorscheme ' .. next_scheme)
        print('Switched to ' .. next_scheme .. ' color scheme')
    else
        print('Last available scheme selected, use <leader>rcc to go back: ' .. current_scheme)
    end
end

function reverse_cycle_color_schemes()
    local current_scheme = vim.fn.execute('colorscheme'):gsub("\n", "")
    local available_schemes = reverse_list_color_schemes()
    local next_scheme

    for i, scheme in ipairs(available_schemes) do
        local scheme_name = scheme:gsub("%.vim$", "")
        if scheme_name == current_scheme then
            next_scheme = available_schemes[(i % #available_schemes) + 1]:gsub("%.vim$", "")
            break
        end
    end

    if next_scheme and next_scheme ~= 'README.txt' then
        vim.cmd('colorscheme ' .. next_scheme)
        print('Switched to ' .. next_scheme .. ' color scheme')
    else
        print('First available scheme selected, use <leader>cc to go forward: ' .. current_scheme)
    end
end
---------------------------------------------------------------------
------------------------ Darling Keybindings ------------------------
---------------------------------------------------------------------

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

-- Cycle through color schemes
vim.api.nvim_set_keymap('n', '<leader>cc', [[:lua cycle_color_schemes()<CR>]], { noremap = true, silent = true })

-- Cycle through color schemes
vim.api.nvim_set_keymap('n', '<leader>rcc', [[:lua reverse_cycle_color_schemes()<CR>]], { noremap = true, silent = true })
-- Enter command mode, and begin a call to read !, the
-- output of whatever command is then entered will be
-- inserted into the current file on the line below
-- the line the cursor is currently on.
vim.keymap.set('n', '<leader>iso', ':read !')

-- Edit init.lua
vim.keymap.set('n', '<leader>elc', ':tabe $MYVIMRC<cr>')

-- Edit darling.lua
vim.keymap.set('n', '<leader>edc', ':tabe ~/.config/nvim/lua/custom/plugins/darling.lua<cr>')

---------------------------------------------------------------------
----------------------- Darling Auto Commands -----------------------
---------------------------------------------------------------------

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- return {} is required even if it is empty.
return {
    'phpactor/phpactor',
}
