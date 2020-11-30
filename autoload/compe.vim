"
" compe#complete
"
function! compe#complete() abort
  call luaeval('require"compe":on_manual_complete()')
  return ''
endfunction

"
" compe#confirm
"
function! compe#confirm(...) abort
  if complete_info(['selected']).selected != -1
    return "\<C-y>"
  endif
  return get(a:000, 0, '')
endfunction

"
" compe#close
"
function! compe#close(...) abort
  if pumvisible()
    call luaeval('require"compe":clear()')
  endif
  return get(a:000, 0, '')
endfunction

"
" compe#is_selected_manually
"
function! compe#is_selected_manually() abort
  return pumvisible() && !empty(v:completed_item) ? v:true : v:false
endfunction

"
" compe#has_completed_item
"
function! compe#has_completed_item() abort
  return !empty(v:completed_item) ? v:true : v:false
endfunction

"
" compe#setup
"
function! compe#setup(config) abort
  call luaeval('require"compe".setup(_A[1])', [a:config])
endfunction

"
" compe#register_source
"
function! compe#register_source(name, source) abort
  if matchstr(a:name, '^\w\+$') ==# ''
    throw "compe: the source's name must be \w\+"
  endif
  return compe#source#vim_bridge#register(a:name, a:source)
endfunction

