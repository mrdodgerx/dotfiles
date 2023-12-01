call plug#begin()

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Plugins for Python
Plug 'vim-syntastic/syntastic'     " Syntax checking plugin
Plug 'davidhalter/jedi-vim'         " Python autocompletion
Plug 'nvie/vim-flake8'              " Linting for Python
Plug 'scrooloose/nerdtree'          " File explorer

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" NERDTree and related plugins
Plug 'Xuyuanp/nerdtree-git-plugin' " Git integration for NERDTree
Plug 'ryanoasis/vim-devicons' " Icons for NERDTree

" Initialize plugin system
call plug#end()

" Show line numbers
set number

" Configure the status line
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Enable syntax highlighting
syntax enable

" Highlight the current line
set cursorline

" Set background color
set background=dark

" Enable transparency (if supported)
hi Normal guibg=NONE ctermbg=NONE

" Show indentation guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'dashboard']

" Airline settings
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

" Python settings
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

" NERDTree settings
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" NERDTreeGit settings
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Modified'  : 'M',
  \ 'Staged'    : 'S',
  \ 'Untracked' : 'U',
  \ 'Renamed'   : 'R',
  \ 'Unmerged'  : 'X',
  \ 'Deleted'   : 'D',
  \ 'Dirty'     : '!'
\}

" DevIcons settings
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Custom mappings for NERDTree
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

