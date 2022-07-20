" turn relative line numbers on
syntax on
set relativenumber
filetype plugin indent on
set encoding=UTF-8
set shm+=I
set directory=$HOME/.vim/swapfiles//

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Gruber darker color theme
Plug 'drsooch/gruber-darker-vim'
Plug 'rafi/awesome-vim-colorschemes'

" On-demand loading
Plug 'scrooloose/nerdtree'

" Tickscript hightlighting
Plug 'nathanielc/vim-tickscript'

" Surroundings - Brackets, paranthesis, quotes, XML tags and more
Plug 'tpope/vim-surround'

" Status bar
Plug 'vim-airline/vim-airline'

" Commenter
Plug 'preservim/nerdcommenter'

" File structure viewer
Plug 'preservim/tagbar'

" Code completer
Plug 'ycm-core/YouCompleteMe'

" Emmet expansion
Plug 'mattn/emmet-vim'

" Tabular text alignment
Plug 'godlygeek/tabular'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Latex support
Plug 'lervag/vimtex'

" Font sizing
Plug 'drmikehenry/vim-fontsize'

" Initialize plugin system
call plug#end()

nmap <leader>w :bd<CR>
nmap <leader>q :bd!<CR>

if has("gui_running")
	set guifont=UbuntuMono\ Nerd\ Font\ 14
	set guioptions-=m
	set guioptions-=T
	set bt=nofile
	colorscheme onedark
	set clipboard=unnamedplus
endif

" Nerdtree bindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Tagbar bindings
nmap <F8> :TagbarToggle<CR>

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_compiler_method = 'latexrun'
let g:vimtex_compiler_latexmk = {
	\ 'continuous' : 1
	\ }
" colorscheme GruberDarker
