let &runtimepath.=','.string('~/')

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
  Plug 'junegunn/fzf.vim'
  Plug 'udalov/kotlin-vim'
  Plug 'williamboman/mason.nvim'
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
call plug#end()



" seach history of open files
nnoremap <c-e> :History<CR>
inoremap <c-e> <Esc>:History<CR>
vnoremap <c-e> <Esc>:History<CR>

"execute \"set <M-f>=\ef"
" search all files 
"nnoremap <M-f> :Files ~/<CR>
"inoremap <M-f> <Esc>:Files ~/<CR>
"vnoremap <M-f> <Esc>:Files ~/<CR>

nnoremap <A-f> :Files ~/<CR>
inoremap <A-f> <Esc>:Files ~/<CR>
vnoremap <A-f> <Esc>:Files ~/<CR>



" search in current file 
nnoremap <c-f> :BLines<CR>
inoremap <c-f> <Esc>:BLines<CR>
vnoremap <c-f> <Esc>:BLines<CR>


" search command history
nnoremap <c-r> :History:<CR>
inoremap <c-r> <Esc>:History:<CR>
vnoremap <c-r> <Esc>:History:<CR>


" Always copy to clipboad
nnoremap yy "+yy
vnoremap y "+y
nnoremap yiw "+yiw

nnoremap p "+p
vnoremap p "+p

nnoremap dd "+dd
vnoremap d "+d

vnoremap x "+x

" Terminal
map <c-w> :terminal<CR>

lua require('config')
