source $VIMRUNTIME/defaults.vim

set number
set scrolloff=2
set splitbelow
set splitright
set clipboard=unnamed,unnamedplus
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2 
set lines=35
set columns=150
set guifont=fixedsys:h10

"nnoremap J 5gj
"nnoremap K 5gk

nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

inoremap <c-p> <esc>pa 

set nobackup
set nowritebackup
set noswapfile
set incsearch

nnoremap zj mayyp`aj
nnoremap zk mayyP`ak



scriptversion 4

command! -nargs=* -range Grep call Grep(<count>, <q-args>)

function! Grep(count, query)
  let query = a:query
  let count = a:count

  if count >=0
    let saved_register = @a

    try
      normal! gv"ay
      let query = @a
    finally
      let @a = saved_register
    endtry

  elseif query == ''
    let query = expand('<cword>')
  endif

  exe 'vimgrep /' .. escape(query, '/') .. '/ **/* .*'
  copen
endfunction

