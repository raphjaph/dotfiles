require('mappings')
require('plugins')

vim.api.nvim_exec(
  [[
""""""""""""""""""""""""""""""""""""""""""""""
"       Airlines Status Bar and Tabs         "
""""""""""""""""""""""""""""""""""""""""""""""
"let airline_theme = 'base16_default_dark'
"let airline_detect_modified = 1 " highlight modified buffers
"
"" instantiate symbols dictionary first
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_symbols.linenr = ' '
"let g:airline_symbols.maxlinenr = ' '
"let g:airline_symbols.colnr = ':'
"let g:airline_symbols.branch = ''
"
"" buffer/tabline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#show_splits = 0 " don't show tab name on right
"let g:airline#extensions#tabline#buffer_idx_mode = 1 " show buffer indices
"
"nmap <LEADER>1 <plug>AirlineSelectTab1
"nmap <LEADER>2 <plug>AirlineSelectTab2
"nmap <LEADER>3 <plug>AirlineSelectTab3
"nmap <LEADER>4 <plug>AirlineSelectTab4
"nmap <LEADER>5 <plug>AirlineSelectTab5
"nmap <LEADER>6 <plug>AirlineSelectTab6
"nmap <LEADER>7 <plug>AirlineSelectTab7
"nmap <LEADER>8 <plug>AirlineSelectTab8
"nmap <LEADER>9 <plug>AirlineSelectTab9
"nmap <LEADER>n <plug>AirlineSelectNext
"nmap <LEADER>p <plug>AirlineSelectPrev


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

set errorformat   =%f:%l:%c:%m           " set errorformat
]],
  false
)
