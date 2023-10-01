call plug#begin('~/.vim/plugged')

Plug 'OmniSharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-buftabline'
Plug 'bkad/CamelCaseMotion'
Plug 'bps/vim-textobj-python', {'for': 'python'}
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-titlecase'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim'
Plug 'jamessan/vim-gnupg'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm'
Plug 'kh3phr3n/python-syntax'
Plug 'lepture/vim-jinja'
Plug 'ludovicchabant/vim-gutentags'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'moll/vim-bbye'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby,eruby' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'ntpeters/vim-better-whitespace'
Plug 'octref/RootIgnore'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'raimon49/requirements.txt.vim'
Plug 'saltstack/salt-vim'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-smooth-scroll'
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby,eruby' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-cucumber', { 'for': 'ruby,eruby,python,cucumber' }
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise', { 'for': 'ruby,eruby' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/loremipsum'
Plug 'vimtaku/hl_matchit.vim'
Plug 'w0rp/ale'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug '~/projects/personal/direct.vim'
let g:polyglot_disabled = ['python']

call plug#end()

" allow hidden buffers
set hidden

" disable swap files
set nobackup
set noswapfile
set nowritebackup

" allow local config
set exrc
set secure

" speed
set ttyfast
set ttimeoutlen=0

" display
set cursorline
set signcolumn=yes
set mouse=a

" show whitespace
set list
set listchars=tab:━━,nbsp:·

" indent
set copyindent
set expandtab
set shiftwidth=2
set smartindent
set tabstop=2

" wrap
set wrap
set formatoptions=crqj

" undo
set undofile
set undodir=~/.vim/undodir

" use system clipboard
set clipboard=unnamed,unnamedplus

" selection
set selection=exclusive

" split directions
set splitright
set splitbelow

" terminal scrollback
if has('nvim')
    set scrollback=100000
endif
