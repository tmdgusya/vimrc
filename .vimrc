syntax enable
set tabstop=4
set softtabstop=4
set encoding=utf-8
set expandtab " tabs are space
set number
set showcmd
set cursorline "higlight current line
set clipboard+=unnamed
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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fatih/molokai'
Plug 'davidhalter/jedi-vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'puremourning/vimspector'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
" Plug 'junegunn/seoul256.vim'
" cp to system clipboard, cv to vim clipboard
Plug 'christoomey/vim-system-copy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" colo seoul256

let g:rehash256=1
let g:molokai_original=1
colo molokai
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'
let g:lsp_semantic_enabled=1
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
nnoremap <leader>n :NERDTreeFocus<CR>
nmap <C-n> :NERDTreeToggle<CR>

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

"for vim-go
" Navigation commands
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)

" Use new vim 8.2 popup windows for Go Doc
let g:go_doc_popup_window = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_auto_sameids = 1

" when you want to show where this function is being used, then use
" :GoReferrers, and then you can navigate through the list with ctrl + w
nnoremap <leader>a :cclose<CR>

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
