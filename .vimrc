let has_ycm = v:version >= 703 || (v:version == 703 && has('patch598'))
let has_breakindent = v:version > 704 || (v:version == 704 && has('patch338'))
let has_textchanged = v:version > 704 || (v:version == 704 && has('patch126'))

call plug#begin('~/.vim/plugged')

"util
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'szw/vim-tags'
Plug 'editorconfig/editorconfig-vim'

"motion
Plug 'bkad/CamelCaseMotion'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vimtaku/hl_matchit.vim'
Plug '987poiuytrewq/hl_fold.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'

"buffers
Plug 'tpope/vim-eunuch'
Plug 'moll/vim-bbye'
Plug 'ntpeters/vim-better-whitespace'
Plug 'justinmk/vim-dirvish'

"interface
Plug 'benekastah/neomake'
if has_ycm
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"unite
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'lambdalisue/unite-grep-vcs'
Plug 'osyo-manga/unite-quickfix'
Plug 'tsukkee/unite-tag'

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"ruby
Plug 'tpope/vim-rails', { 'for': 'ruby,eruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby,eruby' }
Plug 'kana/vim-textobj-user', { 'for': 'ruby,eruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby,eruby' }

"file types
Plug 'sheerun/vim-polyglot'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'hashivim/vim-terraform'
Plug 'jamessan/vim-gnupg'

"test
Plug 'kassio/neoterm'
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby,eruby' }

"colors
Plug 'sickill/vim-monokai'
Plug 'gosukiwi/vim-atom-dark'
Plug 'joshdick/onedark.vim'
Plug 'flazz/vim-colorschemes'
Plug 'guns/xterm-color-table.vim'

call plug#end()

"general
set number
set mouse=a
set clipboard=unnamed,unnamedplus
set ttyfast
set ttimeoutlen=0

"leader
let mapleader = "\<Space>"

"motion overrides
noremap H ^
noremap L $
inoremap jk <ESC>
inoremap kj <ESC>

"camelcasemotion
call camelcasemotion#CreateMotionMappings(',')
set selection=exclusive

"colors
set t_Co=256
set background=dark
colorscheme onedark
let g:airline_theme = 'lucius'
highlight! Normal ctermbg=none
highlight! NonText ctermbg=none
highlight! DiffAdd cterm=none ctermfg=none ctermbg=22
highlight! DiffDelete cterm=none ctermfg=52 ctermbg=52
highlight! DiffText cterm=none ctermfg=none ctermbg=17
highlight! link Search IncSearch
highlight! link Pmenu StatusLineNC
highlight! SpellCap cterm=none ctermfg=235 ctermbg=3
set hlsearch
set fillchars=vert:\ ,fold:\ ,
highlight! StatusLineNC ctermbg=235
highlight! VertSplit ctermbg=235

"hl_matchit
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'MatchParen'
let g:hl_matchit_cursor_wait = 0.050
let g:hl_matchit_hl_priority = 1

"hl_fold
let g:hl_fold_enabled = 0
let g:hl_fold_start_text = ''
let g:hl_fold_mid_text = ''
let g:hl_fold_end_text = ''
let g:hl_fold_start_linehl = 'MatchParen'
let g:hl_fold_end_linehl = 'MatchParen'

set nobackup
set nowritebackup
set noswapfile
if has_textchanged
  autocmd TextChanged * nested update
endif
autocmd BufWritePre * StripWhitespace

"indent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set copyindent

"fold
highlight! Folded ctermfg=none ctermbg=235
set foldmethod=syntax
set foldenable
set foldlevelstart=99
function! FoldText()
  return substitute(getline(v:foldstart), '^.', '▶', '') . ' ... ' .
        \ substitute(getline(v:foldend), '^\s*', '', '')
endfunction
set foldtext=FoldText()

"wrap
if has_breakindent
  set breakindent
endif
set linebreak
" don't break on ruby sigils
set breakat-=:
set breakat-=@
set showbreak=└─

"buffer navigation
set hidden
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>k :call smooth_scroll#up(&scroll, 10, 5)<CR>
nnoremap <leader>j :call smooth_scroll#down(&scroll, 10, 5)<CR>
nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>w <C-w>w
nnoremap <leader>n :nohlsearch<CR>

"window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set splitright
set splitbelow
"close preview window
nnoremap <C-c> :cp<CR>
"paste in insert mode
inoremap <C-p> <C-r>"

"git gutter
let g:gitgutter_sign_column_always      = 1
let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_removed            = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed   = '┃'
let g:gitgutter_diff_args = '-b -w --ignore-blank-lines'
nmap <leader>cu <Plug>GitGutterUndoHunk
nmap <leader>cs <Plug>GitGutterStageHunk
nmap <leader>cr <Plug>GitGutterUndoHunk
nmap <leader>cp <Plug>GitGutterPreviewHunk

"vim-tags
let g:vim_tags_auto_generate = 1

"neomake
autocmd! BufReadPost * Neomake
autocmd! BufWritePost * Neomake
let g:neomake_error_sign = {
      \ 'text': '•',
      \ 'texthl': 'GitGutterDelete',
      \ }
let g:neomake_warning_sign = {
      \ 'text': '•',
      \ 'texthl': 'GitGutterChange',
      \ }

"airline
let g:airline_extensions = ['tabline', 'branch', 'unite']
let g:airline_powerline_fonts=1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%{strftime("%H:%M")}'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
set laststatus=2

"unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use('matcher_fuzzy')
call unite#filters#sorter_default#use('sorter_selecta')
call unite#custom#source('file_mru', 'matchers', ['matcher_project_files', 'matcher_fuzzy'])
call unite#custom#source('file', 'converters', ['converter_tail_abbr'])
call unite#custom#source('file', 'matchers', ['matcher_default'])
call unite#custom#source('file_rec,file_rec/git', 'converters', ['converter_relative_abbr'])
nnoremap <leader># :<C-u>Unite -no-split -smartcase -buffer-name=directories -start-insert -hide-source-names file file/new directory/new<CR>
nnoremap <leader>` :<C-u>Unite -no-split -smartcase -buffer-name=directories -start-insert -hide-source-names file file/new directory/new<CR>
nnoremap <leader>d :<C-u>UniteWithBufferDir -no-split -smartcase -buffer-name=directories -start-insert -hide-source-names file file/new directory/new<CR>
nnoremap <leader>f :<C-u>Unite -no-split -smartcase -buffer-name=files -start-insert file_rec/git:--cached:--others:--exclude-standard<CR>
nnoremap <leader>r :<C-u>Unite -no-split -smartcase -buffer-name=recent -start-insert file_mru<CR>
nnoremap <leader>o :<C-u>Unite -no-split -smartcase -start-insert -buffer-name=outline outline<CR>
nnoremap <leader>y :<C-u>Unite -no-split -smartcase -buffer-name=yank history/yank<CR>
nnoremap <leader>b :<C-u>Unite -no-split -smartcase -buffer-name=buffers buffer<CR>
nnoremap <leader>t :<C-u>Unite -no-split -smartcase -buffer-name=tags tag:%<CR>
nnoremap <leader>cc :<C-u>Unite -no-split -smartcase -buffer-name=quickfix quickfix<CR>
nnoremap <leader>cl :<C-u>Unite -no-split -smartcase -buffer-name=locations location_list<CR>
nnoremap <leader>gg :<C-u>Unite -no-split -smartcase -buffer-name=grep grep/git<CR>
nnoremap <leader>gp :<C-u>UniteResume grep<CR>

"unite customisation
function! s:unite_directory_keybindings()
  imap <buffer> <C-h> <Plug>(unite_delete_backward_path)
endfunction
autocmd FileType unite call s:unite_directory_keybindings()
autocmd FileType unite setlocal number

"vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▶'
let g:vimfiler_tree_readonly_icon = ''
autocmd FileType vimfiler nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_cd_or_edit)
autocmd FileType vimfiler nmap <buffer> <LeftMouse> <LeftMouse><Plug>(vimfiler_expand_or_edit)

if has_ycm
  "youcompleteme
  let g:ycm_collect_identifiers_from_tags_files = 1
  let g:ycm_seed_identifiers_with_syntax = 1
  let g:ycm_add_preview_to_completeopt = 0
  set completeopt-=preview
endif

"ruby complete
setlocal omnifunc=syntaxcomplete#Complete
let g:rubycomplete_rails = 1
" let g:rubycomplete_buffer_loading = 1 "this causes massive slowdown
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

"rspec
command! Rspec :call RunNearestSpec()<CR>
command! RspecLast :call RunLastSpec()<CR>
command! RspecFile :call RunCurrentSpecFile()<CR>

"javascript-libraries
let g:used_javascript_libs = 'underscore,jquery,react,angularjs'

"macros
command! HashTorpedo :%s/ ["':]\(\S*\)["']* => / \1: /g

"neovim
if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif

if has('nvim')
  let g:neoterm_position = 'vertical'
  let test#strategy = 'neoterm'
  command! Test :call neoterm#test#run('current')<CR>
  command! TestFile :call neoterm#test#run('file')<CR>
  command! TestAll :call neoterm#test#run('all')<CR>
  command! TestLast :call neoterm#test#rerun()<CR>
endif
