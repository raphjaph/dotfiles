require('plugins')
require('util')
require('settings')
require('mappings')
require('autocmd')

-- ======================================================
-- General Settings
-- ======================================================

local home = vim.env.HOME
local config = home .. '/.config/nvim'
local cmd = vim.cmd

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
-- opt('o', 'foldexpr', 'nvim_treesitter#foldexpr()')
opt('o', 'foldlevel', 99)
-- opt('o', 'foldmethod', 'expr')
opt('o', 'foldmethod', 'syntax')
opt('o', 'hidden', true)
opt('o', 'history', 10000)
opt('o', 'ignorecase', true)
opt('o', 'incsearch', true)
opt('o', 'linebreak', true)
opt('o', 'ma', true)
opt('o', 'mouse', 'a')
opt('o', 'number', true)
-- opt('o', 'noincsearch', true)
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

vim.api.nvim_exec(
  [[
""""""""""""""""""""""""""""""""""""""""""""""
"             Functions                      "
""""""""""""""""""""""""""""""""""""""""""""""

function! g:CargoLimitOpen(result)
  let l:winnr = winnr()

  let l:quickfix_is_open = QuickfixIsOpen()

  cgetexpr []
  for file in a:result['files']
    caddexpr file['path'].':'.file['line'].':'.file['column'].':'.file['message']
  endfor

  if !l:quickfix_is_open
    cclose
  endif

  if l:winnr !=# winnr()
    wincmd p
  endif
endfunction

function! QuickfixIsOpen()
  for n in range(1, winnr('$'))
    if getwinvar(n, '&syntax') == 'qf'
      return 1
    endif
  endfor

  return 0
endfunction

function! QuickfixNext(previous)
  if len(getqflist()) == 0
    echo "Quickfix list empty."
    return
  endif

  if QuickfixIsOpen()
    if a:previous
      execute "normal \<plug>(qf_qf_previous)"
    else
      execute "normal \<plug>(qf_qf_next)"
    endif
  else
    execute "normal \<plug>(qf_qf_toggle_stay)"
    execute 'cc 1'
  endif
endfunction

nnoremap + :call QuickfixNext(0)<cr>|                  " go to next error
map  -  <plug>(qf_qf_toggle_stay)|                     " toggle quickfix window
nnoremap _ :call QuickfixNext(1)<cr>|                  " go to previous error
nnoremap <leader>qc :call setqflist([])<cr>|           " clear quickfix list

set errorformat=%f:%l:%c:%m
]],
  false
)

-- opt('o', 'nofoldenable', true)
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
