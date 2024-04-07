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
Plug 'davidhalter/jedi-vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'puremourning/vimspector'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/seoul256.vim'
" cp to system clipboard, cv to vim clipboard
Plug 'christoomey/vim-system-copy'
call plug#end()

colo seoul256
let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'
let g:lsp_semantic_enabled=1
let g:ycm_auto_trigger=1 
if executable('pylsp')
        " pip install python-lsp-server
        au User lsp_setup call lsp#register_server({
                                \ 'name': 'pylsp',
                                \ 'cmd': {server_info->['pylsp']},
                                \ 'allowlist': ['python'],
                                \ })
endif

function! s:on_lsp_buffer_enabled() abort
        setlocal omnifunc=lsp#complete
        setlocal signcolumn=yes
        if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
        nmap <buffer> gd <plug>(lsp-definition)
        nmap <buffer> gs <plug>(lsp-document-symbol-search)
        nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
        nmap <buffer> gr <plug>(lsp-references)
        nmap <buffer> gi <plug>(lsp-implementation)
        nmap <buffer> gt <plug>(lsp-type-definition)
        nmap <buffer> <leader>rn <plug>(lsp-rename)
        nmap <buffer> [g <plug>(lsp-previous-diagnostic)
        nmap <buffer> ]g <plug>(lsp-next-diagnostic)
        nmap <buffer> K <plug>(lsp-hover)
        nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
        nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

        let g:lsp_format_sync_timeout = 1000
        autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

        " refer to doc to add more commands
endfunction

augroup lsp_install
        au!
        " call s:on_lsp_buffer_enabled only for languages that has the server registered.
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" for NERD Tree
nnoremap <leader>n :NERDTreeFocus<CR>
nmap <C-n> :NERDTreeToggle<CR>

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree


" You complete me
function! BuildYCM(info)
        " info is a dictionary with 3 fields
        " - name:   name of the plugin
        " - status: 'installed', 'updated', or 'unchanged'
        " - force:  set on PlugInstall! or PlugUpdate!
        if a:info.status == 'installed' || a:info.force
                !./install.py
        endif
endfunction
