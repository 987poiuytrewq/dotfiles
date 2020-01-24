let has_textchanged = v:version > 704 || (v:version == 704 && has('patch126'))

call plug#begin('~/.vim/plugged')

Plug 'Quramy/vim-js-pretty-template'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
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
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm'
Plug 'kh3phr3n/python-syntax'
Plug 'lepture/vim-jinja'
Plug 'ludovicchabant/vim-gutentags'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mitsuhiko/vim-rst'
Plug 'moll/vim-bbye'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby,eruby' }
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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': 'ruby,eruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/loremipsum'
Plug 'vimtaku/hl_matchit.vim'
Plug 'w0rp/ale'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug '~/projects/personal/direct.vim'

call plug#end()

"general
set cursorline
set signcolumn=yes
set mouse=a
set ttyfast
set ttimeoutlen=0
set undofile
set undodir=~/.vim/undodir

"clipboard
set clipboard=unnamed,unnamedplus

set selection=exclusive


set nobackup
set nowritebackup
set noswapfile
augroup autosave
    autocmd!
    autocmd InsertLeave * nested update

    if has_textchanged
        autocmd TextChanged * nested update
    endif
augroup END

"indent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set copyindent
set wrap
set formatoptions=crqj

augroup help
    autocmd!
    autocmd FileType help wincmd L
augroup END


"whitespace
set list
set listchars=tab:━━,nbsp:·

set hidden

"buffer navigation
let scroll = 10

set splitright
set splitbelow

"git gutter
let signcolumn="yes"

set noshowmode
set laststatus=2


if has('nvim')
    set scrollback=100000
    let test#strategy = 'neoterm'
    let g:neoterm_default_mod = 'vertical'
endif

set exrc
set secure
