-- Setup theme
vim.cmd([[colorscheme nord]])

vim.cmd([[command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
command! -bang Ideas call fzf#vim#files('~/ideas', <bang>0)
command! -bar -bang Maps call fzf#vim#maps("n", <bang>0)
]])

vim.cmd('nmap gs <plug>(GrepperOperator)')
vim.cmd('xmap gs <plug>(GrepperOperator)')

vim.cmd([[
inoremap <c-u> <esc>viwUi
inoremap <c-l> <esc>viwui
inoremap jk <esc>
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <Leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <Leader>' <esc>`<i'<esc>`>a'<esc>
vnoremap <Leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <c-r> "0y:%s/<c-r>0//gc<left><left><left>
nnoremap <leader>n<left> :tabp<cr>
nnoremap <leader>m<right> :tabn<cr>
tnoremap <esc> <c-\><c-n>
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>
nnoremap [Q :cfirst<cr>
nnoremap ]Q :clast<cr>

nnoremap <leader>ghw :h <C-R>=expand('<cword>')<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ghw :h <C-R>=expand('<cword>')<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

nnoremap <Leader>cc "+gP
vnoremap <Leader>cv "+y
vnoremap <Leader>cx "+x
nnoremap <c-d> yyp
nnoremap <c-s> :wa<cr>
inoremap <c-s> <esc>:wa<cr>i
nnoremap <c-l> :tabnext<cr>
inoremap <c-l> <esc>:tabnext<cr>i
nnoremap <c-h> :tabprevious<cr>
inoremap <c-h> <esc>:tabprevious<cr>i
]])

vim.cmd([[syntax on]])
vim.cmd([[highlight ColorColumn ctermbg=0 guibg=lightgrey]])


vim.cmd([[
augroup filetype_c
  autocmd!
  autocmd Filetype c set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
augroup END
augroup filetype_js_ts
  autocmd!
  autocmd Filetype javascript nnoremap <buffer> <localleader>c I//<esc>
  autocmd Filetype typescript nnoremap <buffer> <localleader>c I//<esc>
augroup END

augroup filetype_scss
  autocmd!
  autocmd FileType scss setl iskeyword+=@-@
augroup END
augroup filetype_json
  autocmd!
  autocmd Filetype json setlocal filetype=jsonc
augroup END
augroup filetype_vim
  autocmd!
  autocmd Filetype vim setlocal foldmethod=marker
augroup END
nmap <leader><c-n> : NERDTreeToggle<CR>
let test#custom_runners = {'typescript': ['deno']}
if executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
augroup fugitive
  autocmd!
  autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' nnoremap <buffer> .. :edit %:h<cr>
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
]])

vim.cmd([[
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }
let g:tagbar_type_typescript = {
\ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
]])


vim.cmd([[
nnoremap <Leader>di <Plug>VimspectorBalloonEval
xnoremap <Leader>di <Plug>VimspectorBalloonEval
]])

vim.cmd([[
nmap <leader><C-s> <Plug>MarkdownPreview
nmap <leader><M-s> <Plug>MarkdownPreviewStop
nmap <leader><C-p> <Plug>MarkdownPreviewToggle
]])
