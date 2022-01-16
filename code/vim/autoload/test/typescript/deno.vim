if !exists('g:test#typescript#deno#file_pattern')
  let g:test#typescript#deno#file_pattern = '\v_test\.(ts|tsx)$'
endif

function! test#typescript#deno#test_file(file) abort
  return a:file =~# g:test#typescript#deno#file_pattern
endfunction

function! test#typescript#deno#build_position(type, position) abort
    return []
endfunction

function! test#typescript#deno#build_args(args, color) abort
  let args = a:args

  return ['test'] + args
endfunction

function! test#typescript#deno#executable() abort
   return 'deno'
endfunction
