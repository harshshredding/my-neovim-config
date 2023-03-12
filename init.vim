let &runtimepath.=','.string('~/')


" remap leader
let mapleader = ","

filetype plugin indent on

syntax enable

" Improve searching
set ignorecase
set smartcase
set incsearch

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"line numbers
set number

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
  Plug 'junegunn/fzf.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " Use release branch (recommended)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'lervag/vimtex'
  Plug 'tanvirtin/monokai.nvim'
  Plug 'micha/vim-colors-solarized'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
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

nnoremap <A-e> :Files ./<CR>
inoremap <A-e> <Esc>:Files ./<CR>
vnoremap <A-e> <Esc>:Files ./<CR>

" load vimrc
nnoremap <Leader>sv :source $MYVIMRC<CR>

" search in current file 
nnoremap <c-f> :BLines<CR>
inoremap <c-f> <Esc>:BLines<CR>
vnoremap <c-f> <Esc>:BLines<CR>


" search command history
nnoremap <c-r> :History:<CR>
inoremap <c-r> <Esc>:History:<CR>
vnoremap <c-r> <Esc>:History:<CR>

" Save file
map <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>

" redo
map <A-u> :redo<CR>

" info
map <C-i> :GoInfo<CR>

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

"gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"go highlight options
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

"Trigger auto completion
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" make <CR> select current item in suggestion. 
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Coc code navigation
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rename coc
nmap <silent> rn <Plug>(coc-rename)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"Close other splits
nmap <silent> qw :only<CR>

"Soft linebreaks 
"set wrap linebreak nolist

" move between soft lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'


" latex settings
let g:tex_flavor = 'latex'           " Vim ships with some support for plain TeX, ConTeXt, and LaTeX files. This means that the `.tex` extension is ambiguous. Vimtex is only activated for LaTeX files with 'filetype' set to `tex`.
let g:vimtex_view_method = 'mupdf'   "  Set the pdf viewer. MuPDF supports forward and backward search via xdotool. For backward search use :VimtexRSearch command. Forward search will only take you to the correct page.  Backward search will take you to the line in Vim that corresponds to the first line of the current page in MuPDF.
let g:vimtex_compiler_latexmk= {'options' : ['-pdf', '-shell-escape', '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode',],} " we need to enable -shell-escape to be able to use externalization library for avioiding recompiling unchanged diagrams/graphs created using tikz/pgfplots
let g:vimtex_format_enabled = 1
" Don't open window when there are only warnings.
let g:vimtex_quickfix_open_on_warning = 0

" Set tokyo theme
" colorscheme tokyonight-moon
colorscheme monokai

lua require('config')
