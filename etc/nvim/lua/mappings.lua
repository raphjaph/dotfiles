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
map('n', '<LEADER>ff', '<CMD>Telescope find_files<CR>')
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


-- map('n', '<LEADER>bb', '<CMD>BufferOrderByBufferNumber<CR>')
-- map('n', '<LEADER>bd', '<CMD>BufferOrderByDirectory<CR>')
-- map('n', '<LEADER>bl', '<CMD>BufferOrderByLanguage<CR>')
--map('i', '!', '!<c-g>u')
--map('i', ',', ',<c-g>u')
--map('i', '.', '.<c-g>u')
--map('i', '<c-j>', '<esc>')
--map('i', '<down>', '<nop>')
--map('i', '<left>', '<nop>')
--map('i', '<right>', '<nop>')
--map('i', '<up>', '<nop>')
--map('i', '?', '?<c-g>u')
--map('n', '0', '^')
--map('n', ';;', '<esc>A;<esc>')
--map('n', '<bs>', '<c-^>')
--map('n', '<c-j>', ':bp<cr>')
--map('n', '<c-k>', ':bn<cr>')
--map('n', '<c-l>', ':noh<cr>', { silent = true })
--map('n', '<c-w>', ':bd<cr>')
--map('n', '<down>', '<nop>')
--map('n', '<leader>ea', ':split ~/.aliases<cr>')
--map('n', '<leader>en', ':e notes.md<cr>')
--map('n', '<leader>s', ':RustFmt<cr>')
--map('n', '<leader>sb', '<cmd>Telescope buffers<cr>')
--map('n', '<leader>ss', ':source %<cr>')
--map('n', '<leader>sv', ':luafile ' .. config .. '/init.lua<cr>')
--map('n', '<left>', '<nop>')
--map('n', '<right>', '<nop>')
--map('n', '<up>', '<nop>')
--map('n', 'N', 'Nzzzv')
--map('n', 'Q', '<nop>')
--map('n', 'Y', 'y$')
--map('n', 'Z', '<cmd>wq<cr>')
--map('n', '^', '0')
--map('n', 'n', 'nzzzv')
--map('o', 'b', 'i[')
--map('o', 'in', ':<c-u>normal! f(vi(<cr>')
--map('o', 'p', 'i(')
--map('v', '<c-j>', '<esc>')
--map('v', '<leader>a"', ':Tabularize /"<cr>')
--map('v', '<leader>a#', ':Tabularize /#<cr>')
--map('v', '<leader>a:', ':Tabularize /:<cr>')
--map('v', '<leader>a=', ':Tabularize /=<cr>')
--map('v', '<leader>s', ':sort<cr>')

-- Add custom find command to telescope: `find_files`, in order
-- to find dotfiles and ignore git files.

--map(
--  'n',
--  '<c-s>',
--  strip([[
--    <cmd>
--    lua require("telescope.builtin").find_files({
--      find_command = {
--        "rg",
--        "--files",
--        "--hidden",
--        "-g",
--        "!.git"
--      }})
--    <cr>
--  ]]),
--  { noremap = true, silent = true }
--)

-- Map `<c-p>` to open the telescope file browser, can create
-- files with <c-e>.

-- Open `lsp.log`
--map('n', '<leader>ll', ":lua vim.cmd(':e' .. vim.lsp.get_log_path())<cr>")
