let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Plugins
call plug#begin()
Plug 'fatih/vim-go'
Plug 'fatih/molokai'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Leader
let mapleader = ","

" Theme
let g:rehash256 = 1
colorscheme molokai

" detect file types
filetype plugin indent on

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"

" vim-airline
let g:airline#extensions#tabline#enabled = 2

" vim-go
set autowrite
map <C-n> :cnext<CR>					" jump to next error in quickfix list
map <C-m> :cprevious<CR>				" jump to previous error in quickfix list
nnoremap <leader>a :cclose<CR>				" close the quickfix list
autocmd FileType go nmap <leader>t  <Plug>(go-test)	" execute tests
autocmd FileType go nmap <leader>r  <Plug>(go-run)	" run current program

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>	" build or test compile based on file
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)		" toggle go coverage
let g:go_fmt_command = "goimports"			" use goimports to format code
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" change tab formatting for go files
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=100

let g:deoplete#enable_at_startup = 1

