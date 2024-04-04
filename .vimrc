colorscheme badwolf
syntax enable
set tabstop=4
set softtabstop=4
set encoding=utf-8
set expandtab " tabs are space
set number
set showcmd
set cursorline "higlight current line
set clipboard=unnamedplus
filetype indent on "load filetype-specific indent lines, and guessing what filetype is
set wildmenu "display some commands suggested automatically by Vim
set showmatch "highlight the other parenthesis-like characther that is matched with current character
set incsearch
set hlsearch

" more vertically by visual line
nnoremap j gj
nnoremap k gk
" each character will be used instead of '^' and '$' that mean 'infront of this line', and 'end of this line'
nnoremap B ^
nnoremap E $
" this below operations won't operate anymore
nnoremap & <nop>
nnoremap ^ <nop>
let mapleader=","
nnoremap <F5> :GundoToggle<CR>

call plug#begin('~/.vim/plugged')
" Plugin definitions go here
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
call plug#end()

" This is for using tab for trigger completion
" visible() funciton means that my vim in the situation where can see the
" recommendation function list
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()

inoremap <silent><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" This is for comfirming what I'll be using for this line where the
" recommendation can see
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<C-R>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = ['coc-tsserver']

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" for NERD Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
