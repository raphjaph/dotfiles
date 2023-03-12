require('util')
require('plugins')
require('plugin-settings')
require('mappings')
require('autocmd')
require('vim-script')

-- ======================================================
-- General Settings
-- ======================================================

opt('o', 'termguicolors', true)
vim.cmd('colorscheme PaperColor')
vim.cmd('syntax on')

opt('g', 'mapleader', ' ')
opt('o', 'autoindent', true)
opt('o', 'autoread', true)
opt('o', 'background', 'dark')
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'cursorline', true)
opt('o', 'expandtab', true)
opt('o', 'foldexpr=nvim_treesitter#foldexpr()', true)
opt('o', 'foldlevel', 99)
opt('o', 'foldmethod', 'expr')
opt('o', 'hidden', true)
opt('o', 'history=10000', true)
opt('o', 'ignorecase', true)
opt('o', 'incsearch', true)
opt('o', 'linebreak', true)
opt('o', 'ma', true)
opt('o', 'mouse', 'a')
opt('o', 'nofoldenable', true)
opt('o', 'number', true)
opt('o', 'ruler', true)
opt('o', 'scrolloff', 15)
opt('o', 'showcmd', true)
opt('o', 'signcolumn', 'yes')
opt('o', 'smartcase', true)
opt('o', 'smartindent', true)
opt('o', 'spelllang', 'en')
opt('o', 'splitbelow', true)
opt('o', 'title', true)
opt('o', 'ttyfast', true)
opt('o', 'undofile', true)
opt('o', 'visualbell', true)
opt('o', 'wildmode', 'longest,list,full')

-- opt('o', 'autochdir', true)
-- opt('o', 'backspace', 'indent,eol,start')
-- opt('o', 'backup', false)
-- opt('o', 'backupcopy', 'yes')
-- opt('o', 'belloff', 'all')
-- opt('o', 'conceallevel', 2)
-- opt('o', 'foldenable', false)
-- opt('o', 'shiftwidth', 2)
-- opt('o', 'shiftwidth', 2)
-- opt('o', 'tabpagemax', 30)
-- opt('o', 'tabstop', 2)
-- opt('o', 'textwidth', 120)
-- opt('o', 'wrap', true)
-- opt('o', 'autochdir', true)
-- opt('o', 'backspace', 'indent,eol,start')
-- opt('o', 'backup', false)
-- opt('o', 'backupcopy', 'yes')
-- opt('o', 'belloff', 'all')
-- opt('o', 'conceallevel', 2)
-- opt('o', 'foldenable', false)
-- opt('o', 'shiftwidth', 2)
-- opt('o', 'shiftwidth', 2)
-- opt('o', 'tabpagemax', 30)
-- opt('o', 'tabstop', 2)
-- opt('o', 'textwidth', 120)
-- opt('o', 'wrap', true)
