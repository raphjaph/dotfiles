require('functions')

local home = vim.env.HOME
local config = home .. '/.config/nvim'

map(
  'n',
  '<LEADER>fb',
  ':Telescope file_browser<cr>',
  { noremap = true, silent = true }
)
map('n', '<LEADER>gr', '<CMD>Telescope live_grep<CR>')
map('n', '<LEADER>ff', '<CMD>Telescope find_files hidden=true<CR>')
map('n', '<LEADER>sb', '<CMD>Telescope buffers<CR>')
map('n', '<LEADER>ss', ':source %<CR>')
map('n', '<LEADER>sv', ':luafile ' .. config .. '/init.lua<CR>')
map('n', '<LEADER>ee', '<CMD>lua vim.diagnostic.open_float()<CR>')
map('n', '<LEADER>qq', '<CMD>lua vim.diagnostic.setloclist()<CR>')
map('n', '[d', '<CMD>lua vim.diagnostic.goto_prev()<CR>')
map('n', ']d', '<CMD>lua vim.diagnostic.goto_next()<CR>')
map('n', '<LEADER>1', '<CMD>BufferGoto 1<CR>')
map('n', '<LEADER>2', '<CMD>BufferGoto 2<CR>')
map('n', '<LEADER>3', '<CMD>BufferGoto 3<CR>')
map('n', '<LEADER>4', '<CMD>BufferGoto 4<CR>')
map('n', '<LEADER>5', '<CMD>BufferGoto 5<CR>')
map('n', '<LEADER>6', '<CMD>BufferGoto 6<CR>')
map('n', '<LEADER>7', '<CMD>BufferGoto 7<CR>')
map('n', '<LEADER>8', '<CMD>BufferGoto 8<CR>')
map('n', '<LEADER>9', '<CMD>BufferGoto 9<CR>')
map('n', '<LEADER>0', '<CMD>BufferLast<CR>')
map('n', '<LEADER>x', '<CMD>BufferClose<CR>')
map('n', '<C-n>', '<CMD>BufferNext<CR>')
map('n', '<C-p>', '<CMD>BufferPrev<CR>')
map('n', '<ESC>', '<CMD>noh<RETURN><ESC>')

-- Map `<c-p>` to open the telescope file browser, can create
-- files with <c-e>.

-- Open `lsp.log`
--map('n', '<leader>ll', ":lua vim.cmd(':e' .. vim.lsp.get_log_path())<cr>")
