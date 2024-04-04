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
Plug 'davidhalter/jedi-vim'
Plug 'puremourning/vimspector'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
call plug#end()

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#rename_command_keep_name = "<leader>R"
" for NERD Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
