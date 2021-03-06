""""""""""""""""""""""""""""""""""""""""""
" Claudio's Neovim Plugs configuration
""""""""""""""""""""""""""""""""""""""""""

""" Main nvim configurations
"""""""""""""""""""""""""""""

syntax on
set encoding=utf-8
set splitright " vsplit commands will create a new pane on right
set splitbelow " split command will create a new pane below
set number
set ruler
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set laststatus=2
set cursorline
set nocompatible
set nowrap

""" Plugs
""""""""""""

" Plug's initialization - Plug manager
" git: https://github.com/junegunn/vim-plug

call plug#begin()

" Utilities
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} 
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim' "Search word inside folder
" Has an error, must fix before install
" Plug 'Valloric/YouCompleteMe', {'do': 'python3 install.py --all'}

" Programming
Plug 'vim-syntastic/syntastic' "Lint

" Themes
Plug 'ajh17/Spacegray.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline' "Some Freshness XD

" Git
Plug 'airblade/vim-gitgutter' "To show git diffs
Plug 'tpope/vim-fugitive' "Another git pluggin. need to check what is better.:w

"" Languages

" Javascript
Plug 'pangloss/vim-javascript'

call plug#end()
filetype plugin indent on " To start the airline functions

" -- Plug's End --

""" Plugs Configuration

" Deoplete

" Syntastic Lint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR>

" For Javascript
function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

autocmd FileType javascript let b:syntastic_javascript_jscs_args =
    \ get(g:, 'syntastic_javascript_jscs_args', '') .
    \ FindConfig('-c', '.jscsrc', expand('<afile>:p:h', 1))

" Enable at vim start
let g:ycm_key_list_select_completion = ['<Down>']

""" Themes Configuration
"""""""""""""""""""""""""

set background=dark
colorscheme spacegray

""" Key Mapping
""""""""""""""""

map <C-m> :NERDTreeToggle<CR>

" To Activate FZF filter
map <C-p> :Files<CR>

" YouCompleteMe commands
noremap <expr> <Tab> pumvisible() ? "\<C-n>" : "ᐅ"
set tags=tags
